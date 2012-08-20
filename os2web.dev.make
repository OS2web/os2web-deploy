api = 2
core = 7.x

;; Base of the main make file
includes[base] = "os2web.make"

;; Change/Add stuff here

; OS2Web Modules
projects[os2web][download][revision] = "dev"
projects[os2web][download][url] = "git@github.com:syddjurs/os2web.git"

; OS2Web Themes
projects[cmstheme][download][revision] = "dev"
projects[cmstheme][download][url] = "git@github.com:syddjurs/cmstheme.git"

; Test
projects[simpletest][subdir] = "contrib"

; Development
projects[devel][subdir] = "contrib"
projects[ftools][subdir] = "contrib"
