Further documentation can be found here https://github.com/OS2web/os2web-deploy/wiki


Installation
---------------

Drupal Version: 7.22
Drush Version: 5.8

Install an OS2web Installation via .make

1. Install Drush http://drupal.org/projects/drush
2. `cd [site dir]`
3. `drush dl drupal-7.22 --drupal-project-rename=public_html`
5. `git clone git@github.com:OS2web/os2web-deploy.git -b feature/recursive-make`
6. `cd public_html/profiles`
7. `ln -s ../../os2web-deploy/build/master-latest os2web`

Reroll the modules and contrib modules specified in os2web.make:
- `./reroll.core.sh` or `./reroll.turnkey.sh`

If you need a custom os2web installation with your own profile. The recommended approach is to fork this repo.

Developers!!
---------------

Build by using the dev version of the build script.
  - Note that if you reroll a dev build, the folder would be `dev-latest` instead of `master-latest`

`./reroll.dev.sh` generates a working copy of the git repos. Very good when developing. It includes all modules and setup as the turnkey.

Using the developers version of reroll, all branches of os2web modules should be develop. Note that, because of the recursive make build, os2web modules made by other .make files will get the master branch.

Overview of the directory map
---------------

`[site]`
   - `[public_html]`
       - `[profiles]`
           - `[os2web]` (`symlink ../../os2web-deploy/os2web`)
   - `[os2web-deploy]`
       - `[build]`
           - `[master-latest]`
               - `[modules]`
                   - `[contrib]`
                   - `...`
               - `[libraries]`
               - `[themes]`


Configuration of install profile
---------------
There will be two types of install profiles. Core and Turnkey.

Core modules:
- os2web_base
- os2web_settings
- os2web_frontend
- os2web_meetings
- os2web_borger_dk
- os2web_taxonomies
- os2web_taxon_api
- os2web_search
- os2web_selfservicelinks
- os2web_ad_integration
- os2web_kulturnaut_events
- os2web_webform
- - And their dependents

Activated Turnkey modules:
- os2web_base
- os2web_settings
- os2web_frontend
- os2web_base_panels
- os2web_sections
- os2web_spotbox
- os2web_citizenservices
- os2web_contact
- os2web_meetings
- os2web_node_feedback
- - And their dependents

List of OS2Web modules: (In alphabetic order)
---------------

- [os2web_acadre_esdh](http://github.com/OS2web/os2web_acadre_esdh)
- [os2web_ad_integration](http://github.com/OS2web/os2web_ad_integration)
- [os2web_adlib_api](http://github.com/OS2web/os2web_adlib_api)
- [os2web_base](http://github.com/OS2web/os2web_base)
- [os2web_base_panels](http://github.com/OS2web/os2web_base_panels)
- [os2web_borger_dk](http://github.com/OS2web/os2web_borger_dk)
- [os2web_citizenservices](http://github.com/OS2web/os2web_citizenservices)
- [os2web_contact](http://github.com/OS2web/os2web_contact)
- [os2web_cp_service](http://github.com/OS2web/os2web_cp_service)
- [os2web_esdh_field](http://github.com/OS2web/os2web_esdh_field)
- [os2web_esdh_provider](http://github.com/OS2web/os2web_esdh_provider)
- [os2web_frontend](http://github.com/OS2web/os2web_frontend)
- [os2web_iframe_field](http://github.com/OS2web/os2web_iframe_field)
- [os2web_kulturnaut_events](http://github.com/OS2web/os2web_kulturnaut_events)
- [os2web_meetings](http://github.com/OS2web/os2web_meetings)
- [os2web_node_feedback](http://github.com/OS2web/os2web_node_feedback)
- [os2web_ofir_job](http://github.com/OS2web/os2web_ofir_job)
- [os2web_qbrick](http://github.com/OS2web/os2web_qbrick)
- [os2web_search](http://github.com/OS2web/os2web_search)
- [os2web_sections](http://github.com/OS2web/os2web_sections)
- [os2web_selfservicelinks](http://github.com/OS2web/os2web_selfservicelinks)
- [os2web_settings](http://github.com/OS2web/os2web_settings)
- [os2web_spotbox](http://github.com/OS2web/os2web_spotbox)
- [os2web_taxon_api](http://github.com/OS2web/os2web_taxon_api)
- [os2web_taxon_taxonomy](http://github.com/OS2web/os2web_taxon_taxonomy)
- [os2web_taxonomies](http://github.com/OS2web/os2web_taxonomies)
- [os2web_webform](http://github.com/OS2web/os2web_webform)
