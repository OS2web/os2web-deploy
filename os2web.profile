<?php

/**
 * @file
 * This file includes all hooks to proper set up profile during install
 */
/**
 * Name of profile; visible in profile selection form.
 */
define('PROFILE_NAME', 'OS2Web');

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
    'os2web_profile_prepare' => array(
      'type' => 'normal',
      'display_name' => st('Prepare OS2web..'),
    ),
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
  drupal_set_message('Database import complete, please reload this form to continue.','ok');
}

/**
 * Implements hook_form().
 */
function os2web_settings_form($install_state) {
  drupal_set_title(st('Webservice endpoint setup'));
  $form['os2web_pws_config_group'] = array(
    '#type' => 'fieldset',
    '#title' => t('PWS Endpoint configuration'),
  );
  $form['os2web_pws_config_group']['os2web_pws_url'] = array(
    '#type' => 'textfield',
    '#title' => t('PWS URL for V4'),
    '#default_value' => variable_get('os2web_pws_url'),
    '#description' => t('URL to the PWS webservice endpoint.'),
  );
  $form['os2web_pws_config_group']['os2web_pws_url_v6'] = array(
    '#type' => 'textfield',
    '#title' => t('PWS URL for  V6'),
    '#default_value' => variable_get('os2web_pws_url_v6'),
    '#description' => t('URL to the PWSv6 webservice endpoint.'),
  );
  $form['os2web_pws_config_group']['os2web_pws_url_search'] = array(
    '#type' => 'textfield',
    '#title' => t('PWS URL for Search service'),
    '#default_value' => variable_get('os2web_pws_url_search'),
    '#description' => t('URL to the webservice endpoint that runs the search service.'),
  );
  $form['os2web_pws_config_group']['os2web_pws_user'] = array(
    '#type' => 'textfield',
    '#title' => t('PWS login user'),
    '#default_value' => variable_get('os2web_pws_user'),
    '#description' => t('PWS HTTP authentification user.'),
  );
  $form['os2web_pws_config_group']['os2web_pws_password'] = array(
    '#type' => 'textfield',
    '#title' => t('PWS password'),
    '#default_value' => variable_get('os2web_pws_password'),
    '#description' => t('PWS HTTP authentification password.'),
  );
  $form['os2web_pws_adlib_group'] = array(
    '#type' => 'fieldset',
    '#title' => t('Adlib Endpoint configuration'),
  );
  $form['os2web_pws_adlib_group']['os2web_adlib_url'] = array(
    '#type' => 'textfield',
    '#title' => t('URL for Adlib service endpoint'),
    '#default_value' => variable_get('os2web_adlib_url'),
    '#description' => t('URL to the webservice endpoint that runs the Adlib service.'),
  );

  // Proxy setups.
  $form['os2web_pws_proxy_group'] = array(
    '#type' => 'fieldset',
    '#collapsible' => TRUE,
    '#collapsed' => !variable_get('os2web_pws_proxy'),
    '#title' => t('Proxy configuration'),
    '#weight' => 10,
  );
  $form['os2web_pws_proxy_group']['os2web_pws_proxy'] = array(
    '#type' => 'checkbox',
    '#default_value' => variable_get('os2web_pws_proxy'),
    '#title' => t('Use proxy?'),
  );
  $form['os2web_pws_proxy_group']['os2web_pws_proxy_host'] = array(
    '#type' => 'textfield',
    '#default_value' => variable_get('os2web_pws_proxy_host'),
    '#title' => t('Proxy hostname or IP'),
  );
  $form['os2web_pws_proxy_group']['os2web_pws_proxy_port'] = array(
    '#type' => 'textfield',
    '#default_value' => variable_get('os2web_pws_proxy_port'),
    '#title' => t('Proxy port number.'),
  );
  return system_settings_form($form);
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
  // drupal_load('module', 'feeds');
  module_load_all();
  $config = feeds_source('ofir_job_import')->getConfig();
  $ofir_url = $config['FeedsHTTPFetcher']['source'];
  $form = array(
//    'os2web_import_group' => array(
//      '#type' => 'fieldset',
//      '#title' => st('Taxonomy imports'),
//      '#description' => st('Choose if you wish to import all vocabularies during install.'),
//      'os2web_import_kle_import' => array(
//        '#type' => 'checkbox',
//        '#title' => st('KLE'),
//        '#default_value' => TRUE && !$drush,
//      ),
//      'os2web_import_org_import' => array(
//        '#type' => 'checkbox',
//        '#title' => st('Organizations'),
//        '#default_value' => TRUE && !$drush,
//      ),
//      'os2web_import_pol_import' => array(
//        '#type' => 'checkbox',
//        '#title' => st('Politics'),
//        '#default_value' => TRUE && !$drush,
//      ),
//      'os2web_import_gis_import' => array(
//        '#type' => 'checkbox',
//        '#title' => st('GIS Names'),
//        '#default_value' => TRUE && !$drush,
//      ),
//    ),
    'os2web_import_group2' => array(
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
  // Set default KLE taxonomy feed url.
  $source = feeds_source('taxonomy_kle');
  $config = $source->getConfig();
  $config['FeedsFileFetcher']['source'] = drupal_get_path('module', 'taxonomies_and_taxonomy_importers') . '/data/kle.xml';
  $source->setConfig($config);
  $source->save();

  // Set default Organisation taxonomy feed url.
  $source = feeds_source('taxonomy_organization');
  $config = $source->getConfig();
  $config['FeedsFileFetcher']['source'] = drupal_get_path('module', 'taxonomies_and_taxonomy_importers') . '/data/org.xml';
  $source->setConfig($config);
  $source->save();

  // Set default Politik taxonomy feed url.
  $source = feeds_source('taxonomy_politics');
  $config = $source->getConfig();
  $config['FeedsFileFetcher']['source'] = drupal_get_path('module', 'taxonomies_and_taxonomy_importers') . '/data/pol.xml';
  $source->setConfig($config);
  $source->save();

  // Set default Egenavne/stednavne taxonomy feed url.
  $source = feeds_source('taxonomy_gisnames');
  $config = $source->getConfig();
  $config['FeedsFileFetcher']['source'] = drupal_get_path('module', 'taxonomies_and_taxonomy_importers') . '/data/gis.xml';
  $source->setConfig($config);
  $source->save();

  // Set default Ofir feed url.
  $source = feeds_source('ofir_job_import');
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

  if (variable_get('os2web_import_kle_import', FALSE)) {
    $batch['operations'][] = array('feeds_batch',
      array('import', 'taxonomy_kle', 0));
  }
  if (variable_get('os2web_import_org_import', FALSE)) {
    $batch['operations'][] = array('feeds_batch',
      array('import', 'taxonomy_organization', 0));
  }
  if (variable_get('os2web_import_pol_import', FALSE)) {
    $batch['operations'][] = array('feeds_batch',
      array('import', 'taxonomy_politics', 0));
  }
  if (variable_get('os2web_import_gis_import', FALSE)) {
    $batch['operations'][] = array('feeds_batch',
      array('import', 'taxonomy_gisnames', 0));
  }
  if (variable_get('os2web_import_ofir_import', FALSE)) {
    $batch['operations'][] = array('feeds_batch',
      array('import', 'ofir_job_import', 0));
  }
  // $batch = array();
  // Clean up temporary vars.
  variable_del('os2web_import_ofir_url');
  variable_del('os2web_import_kle_import');
  variable_del('os2web_import_org_import');
  variable_del('os2web_import_pol_import');
  variable_del('os2web_import_gis_import');
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

//  drupal_goto('<front>');
}

// The rest is copy/paste/modify code from demo module. //
/**
 * Imports a database dump file.
 *
 * @see demo_reset()
 */
function import_dump($filename) {
  // Open dump file.
//  if (!file_exists($filename) || !($fp = fopen($filename, 'r'))) {
  if (!file_exists($filename) || !($fp = gzopen($filename, 'r'))) {
    drupal_set_message(t('Unable to open dump file %filename.', array('%filename' => $filename)), 'error');
    return FALSE;
  }

  // Drop all existing tables.
  foreach (list_tables() as $table) {
    if ($table != 'sessions') {
      db_query("DROP TABLE " . $table);
    }
  }

  // Load data from dump file.
  $success = TRUE;
  $query = '';
  while (!feof($fp)) {
    $line = fgets($fp, 16384);
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
          if ($verbose) {
            // Don't use t() here, as the locale_* tables might not (yet) exist.
            drupal_set_message(strtr('Query failed: %query', array('%query' => $query)), 'error');
          }
          $success = FALSE;
        }
        $query = '';
      }
    }
  }
  fclose($fp);

  if (!$success) {
    drupal_set_message(t('Failed importing database from %filename.', array('%filename' => $filename)), 'error');
  }

  return $success;
}

/**
 * Returns a list of tables in the active database.
 *
 * Only returns tables whose prefix matches the configured one (or ones, if
 * there are multiple).
 *
 * @see demo_enum_tables()
 */
function list_tables() {
  return db_query("SHOW TABLES")->fetchCol();
}
