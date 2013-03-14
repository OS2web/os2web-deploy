#!/bin/sh

rm -rf modules themes

drush make --no-gitinfofile -y --no-core --contrib-destination=. --verbose --working-copy os2web.dev.make
