api = 2
core = 7.x

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
