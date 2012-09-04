#!/bin/sh

#export http_proxy=http://localhost:3128/
#export ftp_proxy=http://localhost:3128/

./os2web_build.py -D -m profile -f os2web.dev.make -L dev -l os2web-dev-`date +%Y%m%d%H%M`
