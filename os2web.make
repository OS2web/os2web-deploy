api = 2
core = 7.x

;; Base of the main make file
includes[core] = "os2web.base.make"

;; OS2Web projects:

; OS2Web Modules
projects[os2web][type] = "module"
projects[os2web][download][type] = "git"
projects[os2web][download][tag] = "1.10"
projects[os2web][download][branch] = "master"
projects[os2web][download][url] = "git://github.com/OS2web/os2web.git"

; Borger.dk Integration
projects[os2web_borger_dk][type] = "module"
projects[os2web_borger_dk][download][type] = "git"
; projects[os2web_borger_dk][download][tag] = "1.0"
projects[os2web_borger_dk][download][branch] = "master"
projects[os2web_borger_dk][download][url] = "https://github.com/OS2web/os2web_borger_dk.git"

; OS2Web Themes
projects[os2web-theme][type] = "theme"
projects[os2web-theme][download][type] = "git"
projects[os2web-theme][download][branch] = "simple"
projects[os2web-theme][download][url] = "git://github.com/OS2web/os2web-theme.git"
