<?php

/**
 * @file
 * This file includes all hooks to proper set up profile during install
 */

/**
 * Name of profile; visible in profile selection form.
 */
define('PROFILE_NAME', 'OS2Web Turnkey');

/**
 * Description of profile; visible in profile selection form.
 */
define('PROFILE_DESCRIPTION', 'Generisk Installation af OS2Web.');

/**
 * Implements hook_install_tasks().
 */
function os2web_install_tasks() {
  $task = array(
   'os2web_import_database' => array(
     'type' => 'normal',
     'display_name' => st('Import default database'),
   ),
//    'os2web_profile_prepare' => array(
//      'type' => 'normal',
//      'display_name' => st('Prepare OS2web..'),
//    ),
   'os2web_settings_form' => array(
     'display_name' => st('Setup OS2Web'),
     'type' => 'form',
   ),
    'os2web_import_default_feeds_form' => array(
      'display_name' => st('Setup Imports'),
      'type' => 'form',
    ),
    'os2web_import_default_feeds' => array(
      'display_name' => st('Import default content'),
      'type' => 'batch',
    ),
  );
  return $task;
}

/**
 * Implements hook_profile_prepare().
 */
function os2web_profile_prepare() {
  drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);
  // Menu rebuild neccesary to load xpath_parser
  menu_rebuild();
  drupal_get_form('os2web_settings_form');
  drupal_set_message('Database import complete, please reload this form to continue.', 'ok');
}

/**
 * Implements hook_form().
 */
function os2web_settings_form($install_state) {
  drupal_set_title(st('Settings'));

  // Theme setups.
  $form['os2web_theme_group'] = array(
    '#type' => 'fieldset',
    '#collapsible' => FALSE,
    '#collapsed' => FALSE,
    '#title' => t('Theme configuration'),
    '#weight' => 20,
  );
  $form['os2web_theme_group']['os2web_theme_logo'] = array(
    '#type' => 'managed_file',
    '#title' => t('Upload Logo'),
    '#description' => t('The uploaded image will be used as the themes logo.'),
    '#upload_location' => 'public://',
  );
  $form['#submit'][] = 'os2web_settings_form_submit';
  return system_settings_form($form);
}

/**
 * Form settings submit callback function.
 */
function os2web_settings_form_submit(&$form, $form_state) {
  $theme_settings = variable_get('theme_os2web_core_theme_settings', array());
  if ($theme_settings) {

    // If logo is uploaded, save it in os2web theme.
    if (!empty($form['os2web_theme_group']['os2web_theme_logo']['#file']->uri)) {

      $theme_settings['logo_path'] = $form['os2web_theme_group']['os2web_theme_logo']['#file']->uri;
      $theme_settings['default_logo'] = 0;

      variable_set('theme_os2web_core_theme_settings', $theme_settings);
    }
  }
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function os2web_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = 'OS2Web Test';
  $form['update_notifications']['update_status_module']['#default_value'] = array(0, 0);
  $form['server_settings']['site_default_country']['#default_value'] = 'DK';
  $form['server_settings']['#access'] = FALSE;
  $form['update_notifications']['#access'] = FALSE;
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
}

/**
 * Implements hook_form().
 */
function os2web_import_default_feeds_form($install_state) {
  if ($drush = function_exists('drush_log')) {
    drush_log('Imports disabled during drush install. Rembmer to visit /import.', 'ok');
  }
  drupal_set_title(st('Feeds setup'));
  // drupal_load('module', 'feeds');
  module_load_all();
  $config = feeds_source('os2web_ofir_job_import')->getConfig();
  $ofir_url = $config['FeedsHTTPFetcher']['source'];
  $form = array(
    'os2web_import_group' => array(
      '#type' => 'fieldset',
      '#title' => st('Ofir.dk job Import'),
      '#description' => st('Setup for the Ofir.dk import.'),
      'os2web_import_ofir_url' => array(
        '#type' => 'textfield',
        '#title' => st('Default URL for Ofir.dk job feed.'),
        '#default_value' => $ofir_url,
      ),
      'os2web_import_ofir_import' => array(
        '#type' => 'checkbox',
        '#title' => st('Import during install ?'),
        '#default_value' => FALSE,
      ),
    ),
  );
  return system_settings_form($form);
}

/**
 * Sets up default feeds for os2web.
 */
function os2web_import_default_feeds($install_state) {
  drupal_set_title(st('Feed import'));

  // Set default Ofir feed url.
  $source = feeds_source('os2web_ofir_job_import');
  $config = $source->getConfig();
  $config['FeedsHTTPFetcher']['source'] = variable_get('os2web_import_ofir_url', '');
  $source->setConfig($config);
  $source->save();

  $batch = array(
    'title' => t('Importing feeds'),
    'operations' => array(),
    'progress_message' => t('Current: @current | Remaining:
        @remaining | Total: @total | Percentage: @percentage'),
  );

  if (variable_get('os2web_import_ofir_import', FALSE)) {
    $batch['operations'][] = array('feeds_batch',
      array('import', 'os2web_ofir_job_import', 0));
  }
  // $batch = array();
  // Clean up temporary vars.
  variable_del('os2web_import_ofir_url');
  variable_del('os2web_import_ofir_import');

  return $batch;
}

/**
 * Sets the default language to danish.
 */
function os2web_profile_details() {
  return array(
    'name' => PROFILE_NAME,
    'description' => PROFILE_DESCRIPTION,
//    'language' => "da",
    'language' => "en",
  );
}

/* * ************** DB DUMP INSTALLER *************************** */

/**
 * Custom form submit handler for configuration form.
 *
 * Drops all data from existing database, imports database dump, and restores
 * values entered into configuration form.
 */
function os2web_import_database() {
  // Store the set-up vars:
  $vars = array(
    'site_name',
    'site_mail',
    'date_default_timezone',
    'clean_url',
    'update_status_module',
    'install_task',
    'drupal_private_key',
  );
  $data = array();
  foreach ($vars as $name) {
    $data[$name] = variable_get($name);
  }

  // Import database dump file.
  $os2web_file = dirname(__FILE__) . '/db.sql.gz';
  $success = import_dump($os2web_file);

  if (!$success) {
    return;
  }

  // Now re-set the values they filled in during the previous step.
  foreach ($data as $key => $value) {
    variable_set($key, $value);
  }

  // Perform additional clean-up tasks.
  variable_del('file_temporary_path');
  variable_del('file_public_path');
}

// The rest is copy/paste/modify code from demo module. //
/**
 * Imports a database dump file.
 *
 * @see demo_reset()
 */
function import_dump($filename) {
  // Open dump file.
  if (!file_exists($filename) || !($file = gzopen($filename, 'r'))) {
    drupal_set_message(t('Unable to open dump file %filename.', array('%filename' => $filename)), 'error');
    return FALSE;
  }

  // Load data from dump file. The Dump file should have DROP TABLE in it.
  $success = TRUE;
  $query = '';
  while (!feof($file)) {
    $line = fgets($file, 16384);
    if ($line && $line != "\n" && strncmp($line, '--', 2) && strncmp($line, '#', 1)) {
      $query .= $line;
      if (substr($line, -2) == ";\n") {
        $options = array(
          'target' => 'default',
          'return' => Database::RETURN_NULL,
            // 'throw_exception' => FALSE,
        );
        $stmt = Database::getConnection($options['target'])->prepare($query);
        if (!$stmt->execute(array(), $options)) {
          $success = FALSE;
        }
        $query = '';
      }
    }
  }
  fclose($file);

  if (!$success) {
    drupal_set_message(t('Failed importing database from %filename.', array('%filename' => $filename)), 'error');
  }

  return $success;
}
