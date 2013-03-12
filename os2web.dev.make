api = 2
core = 7.x

;; Base of the main make file
includes[base] = "os2web.make"

;; Change/Add stuff here

; OS2Web Modules
projects[os2web][download][branch] = "develop"
projects[os2web][download][tag] = ""
projects[os2web][download][url] = "git@github.com:OS2web/os2web.git"

projects[os2web_cp_service][download][branch] = "develop"
projects[os2web_cp_service][download][tag] = ""
projects[os2web_cp_service][download][url] = "git@github.com:OS2web/os2web_cp_service.git"

; OS2Web Themes
; projects[cmstheme][download][branch] = "develop"
projects[cmstheme][download][tag] = ""
projects[cmstheme][download][url] = "git@github.com:OS2web/os2web-theme.git"

; Development
projects[devel][subdir] = "contrib"
projects[ftools][subdir] = "contrib"
projects[diff][subdir] = "contrib"
