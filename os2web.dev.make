api = 2
core = 7.x

includes[base] = "os2web.make"

; OS2Web Modules
projects[os2web][download][revision] = "dev"

; OS2Web Themes
projects[cmstheme][download][revision] = "dev"

; Test
projects[simpletest][subdir] = "contrib"

; Development
projects[devel][subdir] = "contrib"
projects[ftools][subdir] = "contrib"
