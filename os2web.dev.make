api = 2
core = 7.x

projects[drupal][type] = "core"
projects[drupal][version] = "7.14"
projects[drupal][patch][1187776] = "http://drupal.org/files/1187776.patch"
projects[drupal][patch][1277376] = "http://drupal.org/files/common.inc-1277376-36.patch"

; OS2Web Modules
projects[os2web][type] = "module"
projects[os2web][download][type] = "git"
projects[os2web][download][url] = "git@github.com:syddjurs/os2web.git"
projects[os2web][download][revision] = "dev"

; OS2Web Themes

projects[cmstheme][type] = "theme"
projects[cmstheme][download][type] = "git"
projects[cmstheme][download][url] = "git@github.com:bellcom/cmstheme.git"
projects[cmstheme][download][revision] = "dev"

;projects[syddjurs][type] = "theme"
;projects[syddjurs][download][type] = "git"
;projects[syddjurs][download][url] = "git@github.com:bellcom/os2web-theme-syddjurs.git"
;projects[syddjurs][download][revision] = "dev"

; Test
projects[simpletest][subdir] = "contrib"

; Development
projects[devel][subdir] = "contrib"
projects[ftools][subdir] = "contrib"

; Upstream - To be included:

projects[search_api][subdir] = "contrib"
projects[search_log][subdir] = "contrib"
projects[search_api_ajax][subdir] = "contrib"

