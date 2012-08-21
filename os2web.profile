<?php

function os2web_install_tasks() {
  $task = array(
      'os2web_profile_prepare' => array(
          'type' => 'normal',
          'display_name' => st('Prepare OS2web..')
      ),
      'os2web_settings_form' => array(
          'display_name' => st('Setup OS2Web'),
          'type' => 'form',
      ),
      'os2web_import_default_feeds' => array(
          'display_name' => st('Import default content'),
          'type' => 'batch',
      ),
  );
  return $task;
}

function os2web_profile_prepare() {
  // Menu rebuild neccesary to load xpath_parser
  menu_rebuild();

  variable_set('typekit_api_token','42f286fdd829f36627e2002272e6f5df8a57e8f2');
  typekit_api_fontyourface_import();

}

function os2web_settings_form($install_state) {
  drupal_load('module','os2web_settings');
  module_load_include('admin.inc', 'os2web_settings');
  return os2web_settings_settings_form(array(),array());
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
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
}

function os2web_import_default_feeds($install_state) {
  //Set default KLE taxonomy feed url
  $source = feeds_source('taxonomy_kle');
  $config = $source->getConfig();
  $config['FeedsHTTPFetcher']['source'] = 'http://10.1.1.182/SOFDDataService/SOFDWebService.asmx/GetTaxonomy?taxonomyId=1';
  $source->setConfig($config);
  $source->save();

  //Set default Organisation taxonomy feed url
  $source = feeds_source('taxonomy_organization');
  $config = $source->getConfig();
  $config['FeedsHTTPFetcher']['source'] = 'http://10.1.1.182/SOFDDataService/SOFDWebService.asmx/GetTaxonomy?taxonomyId=5';
  $source->setConfig($config);
  $source->save();

  //Set default Politik taxonomy feed url
  $source = feeds_source('taxonomy_politics');
  $config = $source->getConfig();
  $config['FeedsHTTPFetcher']['source'] = 'http://10.1.1.182/SOFDDataService/SOFDWebService.asmx/GetTaxonomy?taxonomyId=2';
  $source->setConfig($config);
  $source->save();

  //Set default Egenavne/stednavne taxonomy feed url
  $source = feeds_source('taxonomy_gisnames');
  $config = $source->getConfig();
  $config['FeedsHTTPFetcher']['source'] = 'http://10.1.1.182/SOFDDataService/SOFDWebService.asmx/GetGisNames';
  $source->setConfig($config);
  $source->save();

  //Set default Ofir feed url
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
