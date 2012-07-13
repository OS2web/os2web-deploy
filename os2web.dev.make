api = 2
core = 7.x

includes[base] = "os2web.make"

; OS2Web Modules
projects[os2web][download][revision] = "dev"
projects[os2web][download][url] = "git@github.com:syddjurs/os2web.git"

; OS2Web Themes
projects[cmstheme][download][revision] = "dev"
projects[cmstheme][download][url] = "git@github.com:bellcom/cmstheme.git"

; Test
projects[simpletest][subdir] = "contrib"

; Development
projects[devel][subdir] = "contrib"
projects[ftools][subdir] = "contrib"
