Dokumentationen til projektet finde her https://github.com/OS2web/os2web-deploy/wiki


Installation
---------------

Install an OS2web Installation via .make

1. Install Drush http://drupal.org/projects/drush
2. `cd [site dir]`
3. `drush dl drupal-7.x`
4. `mv drupal-7.x public_html`
5. `git clone git@github.com:OS2web/os2web-deploy.git -b feature/recursive-make`
6. `cd public_html/profiles`
7. `ln -s ../../os2web-deploy os2web`

Reroll the modules and contrib modules specified in os2web.make:
- `./reroll.core.sh`, `./reroll.turnkey.sh` or `./reroll.dev.sh`

List of OS2Web modules: (In alphabetic order)
---------------

- http://github.com/OS2web/os2web_acadre_esdh
- http://github.com/OS2web/os2web_ad_integration
- http://github.com/OS2web/os2web_adlib_api
- http://github.com/OS2web/os2web_base
- http://github.com/OS2web/os2web_base_panels
- http://github.com/OS2web/os2web_borger_dk
- http://github.com/OS2web/os2web_citizenservices
- http://github.com/OS2web/os2web_contact
- http://github.com/OS2web/os2web_cp_service
- http://github.com/OS2web/os2web_esdh_field
- http://github.com/OS2web/os2web_esdh_provider
- http://github.com/OS2web/os2web_frontend
- http://github.com/OS2web/os2web_iframe_field
- http://github.com/OS2web/os2web_kulturnaut_events
- http://github.com/OS2web/os2web_meetings
- http://github.com/OS2web/os2web_node_feedback
- http://github.com/OS2web/os2web_ofir_job
- http://github.com/OS2web/os2web_qbrick
- http://github.com/OS2web/os2web_search
- http://github.com/OS2web/os2web_sections
- http://github.com/OS2web/os2web_selfservicelinks
- http://github.com/OS2web/os2web_settings
- http://github.com/OS2web/os2web_spotbox
- http://github.com/OS2web/os2web_taxon_api
- http://github.com/OS2web/os2web_taxon_taxonomy
- http://github.com/OS2web/os2web_taxonomies
- http://github.com/OS2web/os2web_webform
