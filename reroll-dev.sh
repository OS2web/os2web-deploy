#!/bin/sh

export http_proxy=http://localhost:3128/
export ftp_proxy=http://localhost:3128/

./os2web_build.py -D -l -m profile os2web-`date +%Y%m%d%H%M`
