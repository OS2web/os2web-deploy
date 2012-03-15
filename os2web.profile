<?php


function os2web_install_tasks() {
  $task['default_content'] = array(
      'display_name' => st('Add default content'),
      'display' => true,
      'type' => 'batch',
      'run' => INSTALL_TASK_RUN_IF_NOT_COMPLETED,
      'function' => 'os2web_import_default_feeds',
      );
  return $task;
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function os2web_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = 'OS2Web Test';
  $form['update_notifications']['update_status_module']['#default_value'] = array(0,0);
  $form['server_settings']['site_default_country']['#default_value'] = 'DK';
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
}

function os2web_import_default_feeds($install_state) {
  $source = feeds_source('ofir_job_import');
  $config = $source->getConfig();
  $config['FeedsHTTPFetcher']['source'] = 'http://job.ofir.dk/Templates/XMLliste_7DAE0E45-E8C0-43EF-9D3C-350F69BE5C9B.asp';
  $source->setConfig($config);
  $source->save();

  $batch = array(
      'title' => t('Importing feeds'),
      'operations' => array(
        array('feeds_batch', array('import', 'ofir_job_import', 0)),
        ),
      'progress_message' => t('Current: @current | Remaining:
        @remaining | Total: @total | Percentage: @percentage | Estimate:
        @estimate | Elapsed: @elapsed'),
      );
  return $batch;
}
