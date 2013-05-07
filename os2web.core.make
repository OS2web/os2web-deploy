api = 2
core = 7.x

;includes[custom] = os2web.custom.make

;; OS2Web projects:

; OS2Web base
projects[os2web_base][type] = "module"
projects[os2web_base][download][type] = "git"
; projects[os2web_base][download][tag] = "1.0"
projects[os2web_base][download][branch] = "master"
projects[os2web_base][download][url] = "https://github.com/OS2web/os2web_base.git"

; OS2Web base panels
projects[os2web_base_panels][type] = "module"
projects[os2web_base_panels][download][type] = "git"
; projects[os2web_base_panels][download][tag] = "1.0"
projects[os2web_base_panels][download][branch] = "master"
projects[os2web_base_panels][download][url] = "https://github.com/OS2web/os2web_base_panels.git"

; OS2Web settings
projects[os2web_settings][type] = "module"
projects[os2web_settings][download][type] = "git"
; projects[os2web_settings][download][tag] = "1.0"
projects[os2web_settings][download][branch] = "master"
projects[os2web_settings][download][url] = "https://github.com/OS2web/os2web_settings.git"

; OS2Web frontend
projects[os2web_frontend][type] = "module"
projects[os2web_frontend][download][type] = "git"
; projects[os2web_frontend][download][tag] = "1.0"
projects[os2web_frontend][download][branch] = "master"
projects[os2web_frontend][download][url] = "https://github.com/OS2web/os2web_frontend.git"

; OS2Web meetings
projects[os2web_meetings][type] = "module"
projects[os2web_meetings][download][type] = "git"
; projects[os2web_meetings][download][tag] = "1.0"
projects[os2web_meetings][download][branch] = "master"
projects[os2web_meetings][download][url] = "https://github.com/OS2web/os2web_meetings.git"

; OS2Web Borger Dk
projects[os2web_borger_dk][type] = "module"
projects[os2web_borger_dk][download][type] = "git"
; projects[os2web_borger_dk][download][tag] = "1.0"
projects[os2web_borger_dk][download][branch] = "feature/os2web-1.0-migration"
projects[os2web_borger_dk][download][url] = "https://github.com/OS2web/os2web_borger_dk.git"

; OS2Web Taxonomies
projects[os2web_taxonomies][type] = "module"
projects[os2web_taxonomies][download][type] = "git"
; projects[os2web_taxonomies][download][tag] = "1.0"
projects[os2web_taxonomies][download][branch] = "master"
projects[os2web_taxonomies][download][url] = "https://github.com/OS2web/os2web_taxonomies.git"

; OS2Web Taxon Api
projects[os2web_taxon_api][type] = "module"
projects[os2web_taxon_api][download][type] = "git"
; projects[os2web_taxon_api][download][tag] = "1.0"
projects[os2web_taxon_api][download][branch] = "master"
projects[os2web_taxon_api][download][url] = "https://github.com/OS2web/os2web_taxon_api.git"

; OS2Web Search
projects[os2web_search][type] = "module"
projects[os2web_search][download][type] = "git"
; projects[os2web_search][download][tag] = "1.0"
projects[os2web_search][download][branch] = "master"
projects[os2web_search][download][url] = "https://github.com/OS2web/os2web_search.git"

; OS2Web Selfservice links
projects[os2web_selfservicelinks][type] = "module"
projects[os2web_selfservicelinks][download][type] = "git"
; projects[os2web_selfservicelinks][download][tag] = "1.0"
projects[os2web_selfservicelinks][download][branch] = "master"
projects[os2web_selfservicelinks][download][url] = "https://github.com/OS2web/os2web_selfservicelinks.git"

; OS2Web AD integration
projects[os2web_ad_integration][type] = "module"
projects[os2web_ad_integration][download][type] = "git"
; projects[os2web_ad_integration][download][tag] = "1.0"
projects[os2web_ad_integration][download][branch] = "master"
projects[os2web_ad_integration][download][url] = "https://github.com/OS2web/os2web_ad_integration.git"

; OS2Web Kulturnaut Events
projects[os2web_kulturnaut_events][type] = "module"
projects[os2web_kulturnaut_events][download][type] = "git"
; projects[os2web_kulturnaut_events][download][tag] = "1.0"
projects[os2web_kulturnaut_events][download][branch] = "master"
projects[os2web_kulturnaut_events][download][url] = "https://github.com/OS2web/os2web_kulturnaut_events.git"

; OS2Web Webform
projects[os2web_webform][type] = "module"
projects[os2web_webform][download][type] = "git"
; projects[os2web_webform][download][tag] = "1.0"
projects[os2web_webform][download][branch] = "master"
projects[os2web_webform][download][url] = "https://github.com/OS2web/os2web_webform.git"

; OS2Web Hearings
projects[os2web_hearings][type] = "module"
projects[os2web_hearings][download][type] = "git"
; projects[os2web_hearings][download][tag] = "1.0"
projects[os2web_hearings][download][branch] = "master"
projects[os2web_hearings][download][url] = "https://github.com/OS2web/os2web_hearings.git"

; OS2Web Breaking News
projects[os2web_breaking_news][type] = "module"
projects[os2web_breaking_news][download][type] = "git"
; projects[os2web_breaking_news][download][tag] = "1.0"
projects[os2web_breaking_news][download][branch] = "master"
projects[os2web_breaking_news][download][url] = "https://github.com/OS2web/os2web_breaking_news.git"

; OS2Web Help
projects[os2web_help][type] = "module"
projects[os2web_help][download][type] = "git"
; projects[os2web_help][download][tag] = "1.0"
projects[os2web_help][download][branch] = "master"
projects[os2web_help][download][url] = "https://github.com/OS2web/os2web_help.git"

;; Contrib Modules

projects[feeds][type] = "module"
projects[feeds][subdir] = "contrib"
projects[feeds][version] = "2.0-alpha8"

projects[job_scheduler][subdir] = "contrib"
projects[job_scheduler][version] = "2.0-alpha3"

; Feeds SOAP Fetcher
projects[feeds_soap][version] = "1.x"
projects[feeds_soap][type] = "module"
projects[feeds_soap][subdir] = "contrib"
projects[feeds_soap][download][type] = "git"
projects[feeds_soap][download][branch] = "6.x-1.x"
projects[feeds_soap][download][url] = "http://git.drupal.org/project/feeds_soap.git"
# ;D7 port patch
projects[feeds_soap][patch][1539112] = "http://drupal.org/files/feeds_soap-port_to_7-1539112-9.patch"

; Cookiecontrol danish js translation
projects[cookiecontrol][type] = "module"
projects[cookiecontrol][subdir] = "contrib"
projects[cookiecontrol][version] = "1.6"
projects[cookiecontrol][download][type] = "git"
projects[cookiecontrol][download][branch] = "7.x-1.6"
projects[cookiecontrol][patch][read_more_DK] = "patches/cookiecontrol-read_more_DK.patch"

projects[views][subdir] = "contrib"
projects[views][version] = "3.7"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.0"

projects[views_rss][subdir] = "contrib"
projects[views_rss][version] = "2.0-rc3"

projects[simplenews][subdir] = "contrib"
projects[simplenews][version] = "1.0"

projects[word_link][subdir] = "contrib"
projects[word_link][version] = "1.8"

projects[imagecrop][subdir] = "contrib"
projects[imagecrop][version] = "1.0-rc3"

projects[pathauto][subdir] = "contrib"
projects[pathauto][version] = "1.2"

projects[sharethis][subdir] = "contrib"
projects[sharethis][version] = "2.5"

projects[text_resize][subdir] = "contrib"
projects[text_resize][version] = "1.8"

projects[best_responsive][type] = "theme"
projects[best_responsive][version] = "1.1"
