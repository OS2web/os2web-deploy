#!/bin/sh

rm -rf modules themes

drush make --no-gitinfofile -y --no-core --contrib-destination=. --working-copy os2web.make
