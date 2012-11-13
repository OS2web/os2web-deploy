#!/bin/sh

#export http_proxy=http://localhost:3128/
#export ftp_proxy=http://localhost:3128/

./os2web_build.py -m profile -f os2web.dev.make -t os2web-test-`date +%Y%m%d%H%M`
