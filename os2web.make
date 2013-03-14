api = 2
core = 7.x

;; OS2Web projects:

; OS2Web frontend
projects[os2web_frontend][type] = "module"
projects[os2web_frontend][download][type] = "git"
; projects[os2web_frontend][download][tag] = "1.0"
projects[os2web_frontend][download][branch] = "master"
projects[os2web_frontend][download][url] = "git@github.com:OS2web/os2web_frontend.git"

; OS2Web Iframe Field Display
projects[os2web_iframe_field][type] = "module"
projects[os2web_iframe_field][download][type] = "git"
; projects[os2web_iframe_field][download][tag] = "1.0"
projects[os2web_iframe_field][download][branch] = "master"
projects[os2web_iframe_field][download][url] = "git@github.com:OS2web/os2web_iframe_field.git"

; OS2Web acadre_esdh integration
projects[os2web_acadre_esdh][type] = "module"
projects[os2web_acadre_esdh][download][type] = "git"
; projects[os2web_acadre_esdh][download][tag] = "1.10"
projects[os2web_acadre_esdh][download][branch] = "master"
projects[os2web_acadre_esdh][download][url] = "git@github.com:OS2web/os2web_acadre_esdh.git"

; OS2Web CP service
projects[os2web_cp_service][type] = "module"
projects[os2web_cp_service][download][type] = "git"
; projects[os2web_cp_service][download][tag] = "0.1"
projects[os2web_cp_service][download][branch] = "master"
projects[os2web_cp_service][download][url] = "git@github.com:OS2web/os2web_cp_service.git"

; OS2Web Node Feedback
projects[os2web_node_feedback][type] = "module"
projects[os2web_node_feedback][download][type] = "git"
; projects[os2web_node_feedback][download][tag] = "1.10"
projects[os2web_node_feedback][download][branch] = "master"
projects[os2web_node_feedback][download][url] = "git@github.com:OS2web/os2web_node_feedback.git"

; Borger.dk Integration
projects[os2web_borger_dk][type] = "module"
projects[os2web_borger_dk][download][type] = "git"
; projects[os2web_borger_dk][download][tag] = "1.0"
projects[os2web_borger_dk][download][branch] = "master"
projects[os2web_borger_dk][download][url] = "https://github.com/OS2web/os2web_borger_dk.git"

; Kulturnaut Events
projects[os2web_kulturnaut_events][type] = "module"
projects[os2web_kulturnaut_events][download][type] = "git"
; projects[os2web_kulturnaut_events][download][tag] = "1.0"
projects[os2web_kulturnaut_events][download][branch] = "master"
projects[os2web_kulturnaut_events][download][url] = "https://github.com/OS2web/os2web_kulturnaut_events.git"

; Ofir Job
projects[os2web_ofir_job][type] = "module"
projects[os2web_ofir_job][download][type] = "git"
; projects[os2web_ofir_job][download][tag] = "1.0"
projects[os2web_ofir_job][download][branch] = "master"
projects[os2web_ofir_job][download][url] = "https://github.com/OS2web/os2web_ofir_job.git"

# ; OS2Web Taxon API
# projects[os2web_taxon_api][type] = "module"
# projects[os2web_taxon_api][download][type] = "git"
# ; projects[os2web_taxon_api][download][tag] = "1.0"
# projects[os2web_taxon_api][download][branch] = "master"
# projects[os2web_taxon_api][download][url] = "https://github.com/OS2web/os2web_taxon_api.git"

; OS2Web Themes
projects[os2web-theme][type] = "theme"
projects[os2web-theme][download][type] = "git"
projects[os2web-theme][download][branch] = "simple"
projects[os2web-theme][download][url] = "git://github.com/OS2web/os2web-theme.git"


;; Contrib Modules

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
