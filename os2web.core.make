api = 2
core = 7.x

includes[custom] = os2web.custom.make

;; OS2Web projects:

; OS2Web base
projects[os2web_base][type] = "module"
projects[os2web_base][download][type] = "git"
; projects[os2web_base][download][tag] = "1.0"
projects[os2web_base][download][branch] = "master"
projects[os2web_base][download][url] = "git@github.com:OS2web/os2web_base.git"

; OS2Web settings
projects[os2web_settings][type] = "module"
projects[os2web_settings][download][type] = "git"
; projects[os2web_settings][download][tag] = "1.0"
projects[os2web_settings][download][branch] = "master"
projects[os2web_settings][download][url] = "git@github.com:OS2web/os2web_settings.git"

; OS2Web frontend
projects[os2web_frontend][type] = "module"
projects[os2web_frontend][download][type] = "git"
; projects[os2web_frontend][download][tag] = "1.0"
projects[os2web_frontend][download][branch] = "master"
projects[os2web_frontend][download][url] = "git@github.com:OS2web/os2web_frontend.git"

; OS2Web meetings
projects[os2web_meetings][type] = "module"
projects[os2web_meetings][download][type] = "git"
; projects[os2web_meetings][download][tag] = "1.0"
projects[os2web_meetings][download][branch] = "master"
projects[os2web_meetings][download][url] = "git@github.com:OS2web/os2web_meetings.git"

; OS2Web Borger Dk
projects[os2web_borger_dk][type] = "module"
projects[os2web_borger_dk][download][type] = "git"
; projects[os2web_borger_dk][download][tag] = "1.0"
projects[os2web_borger_dk][download][branch] = "master"
projects[os2web_borger_dk][download][url] = "git@github.com:OS2web/os2web_borger_dk.git"

; OS2Web Taxonomies
projects[os2web_taxonomies][type] = "module"
projects[os2web_taxonomies][download][type] = "git"
; projects[os2web_taxonomies][download][tag] = "1.0"
projects[os2web_taxonomies][download][branch] = "master"
projects[os2web_taxonomies][download][url] = "git@github.com:OS2web/os2web_taxonomies.git"

; OS2Web Taxon Api
projects[os2web_taxon_api][type] = "module"
projects[os2web_taxon_api][download][type] = "git"
; projects[os2web_taxon_api][download][tag] = "1.0"
projects[os2web_taxon_api][download][branch] = "master"
projects[os2web_taxon_api][download][url] = "git@github.com:OS2web/os2web_taxon_api.git"

; OS2Web Search
projects[os2web_search][type] = "module"
projects[os2web_search][download][type] = "git"
; projects[os2web_search][download][tag] = "1.0"
projects[os2web_search][download][branch] = "master"
projects[os2web_search][download][url] = "git@github.com:OS2web/os2web_search.git"

; OS2Web Selfservice links
projects[os2web_selfservicelinks][type] = "module"
projects[os2web_selfservicelinks][download][type] = "git"
; projects[os2web_selfservicelinks][download][tag] = "1.0"
projects[os2web_selfservicelinks][download][branch] = "master"
projects[os2web_selfservicelinks][download][url] = "git@github.com:OS2web/os2web_selfservicelinks.git"

; OS2Web AD integration
projects[os2web_ad_integration][type] = "module"
projects[os2web_ad_integration][download][type] = "git"
; projects[os2web_ad_integration][download][tag] = "1.0"
projects[os2web_ad_integration][download][branch] = "master"
projects[os2web_ad_integration][download][url] = "git@github.com:OS2web/os2web_ad_integration.git"

; OS2Web Kulturnaut Events
projects[os2web_kulturnaut][type] = "module"
projects[os2web_kulturnaut][download][type] = "git"
; projects[os2web_kulturnaut][download][tag] = "1.0"
projects[os2web_kulturnaut][download][branch] = "master"
projects[os2web_kulturnaut][download][url] = "git@github.com:OS2web/os2web_kulturnaut.git"

; OS2Web Webform
projects[os2web_webform][type] = "module"
projects[os2web_webform][download][type] = "git"
; projects[os2web_webform][download][tag] = "1.0"
projects[os2web_webform][download][branch] = "master"
projects[os2web_webform][download][url] = "git@github.com:OS2web/os2web_webform.git"

;; Contrib Modules

projects[feeds][subdir] = "contrib"
projects[feeds][version] = "2.0-alpha4"
; Patch to support import of hierarchical taxonomy terms
projects[feeds][patch][] = "http://drupal.org/files/issues/feeds_hierarchical_term_processor-1152940-23.patch"
; Patch to support text format (eg. html) when importing to custom taxonomy term fields
projects[feeds][patch][] = "http://drupal.org/files/feeds-taxonomy-text-format-1466170-1.patch"
; Patch to enable Proxy support
; projects[feeds][patch][] = "patches/feeds-proxy.patch"

projects[job_scheduler][subdir] = "contrib"
projects[job_scheduler][version] = "2.0-alpha3"

; Feeds SOAP Fetcher
projects[feeds_soap][type] = "module"
projects[feeds_soap][subdir] = "contrib"
projects[feeds_soap][download][type] = "git"
projects[feeds_soap][download][branch] = "6.x-1.x"
projects[feeds_soap][download][url] = "git://git.drupal.org/project/feeds_soap.git"
# ;D7 port patch
projects[feeds_soap][patch][] = "patches/feeds_soap-port_to_7-1539112-9.patch"

; Cookiecontrol danish js translation
projects[cookiecontrol][subdir] = "contrib"
projects[cookiecontrol][version] = "1.6"
projects[cookiecontrol][patch][] = "patches/cookiecontrol-read_more_DK.patch"

projects[views][subdir] = "contrib"
projects[views][version] = "3.5"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.0"

projects[views_rss][subdir] = "contrib"
projects[views_rss][version] = "2.0-rc3"

projects[simple_news][subdir] = "contrib"
projects[simple_news][version] = "1.0"

projects[linkit][subdir] = "contrib"
projects[linkit][version] = "2.6"

projects[imagecrop][subdir] = "contrib"
projects[imagecrop][version] = "1.0-rc3"

projects[pathauto][subdir] = "contrib"
projects[pathauto][version] = "1.2"
