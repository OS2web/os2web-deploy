#!/bin/sh

rm -rf modules themes

drush make --no-gitinfofile -y --no-core --contrib-destination=. os2web.turnkey.make
