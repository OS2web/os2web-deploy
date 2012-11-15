#!/bin/sh

#export http_proxy=http://localhost:3128/
#export ftp_proxy=http://localhost:3128/

./os2web_build.py -D -f os2web.base.make -L root -l os2web-root-`date +%Y%m%d%H%M`
rm build/root-latest/profiles/os2web
ln -s ../../dev-latest build/root-latest/profiles/os2web
