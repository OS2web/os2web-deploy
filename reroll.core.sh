#!/bin/sh

mv os2web old-os2web-`date +%Y%m%d%H%M`
mkdir os2web

drush make --no-gitinfofile -y --no-core --contrib-destination=os2web os2web.core.make

cd os2web

ln -s ../os2web.core.info os2web.info
ln -s ../os2web.core.profile os2web.profile
ln -s ../os2web.core.install os2web.install
ln -s ../db.sql.gz db.sql.gz
