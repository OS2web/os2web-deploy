#!/bin/bash

KEEPVERSIONS=3
CLEANUPDIRS="build/dev-20 build/master-20 build/os2web-master-20 build/os2web-dev-20"

DONTDEL=""
for i in $(ls -d build/*latest)
do
  DONTDEL="$DONTDEL "$(basename $(readlink -f $i))
done

DELDIRS=""
for DIR in $CLEANUPDIRS
do
  ls -d -r $DIR* 2>/dev/null | awk "NR>$KEEPVERSIONS"
  DELDIRS="$DELDIRS "$(ls -d -r $DIR* 2>/dev/null | awk "NR>$KEEPVERSIONS")
done

# Try to avoid deleting the latest symlink
for i in $DONTDEL
do
  if [[ "$DELDIRS" == *"$i"* ]]; then
    echo "$i is used in a latest symlink. Aborting"
    exit 2
  fi
done

# trim spaces
DELDIRS=$(echo $DELDIRS | xargs)

if [ "$DELDIRS" == "" ]
  then
  echo "Nothing to delete"
  exit 1
else
  read -p "Going to delete the above dir(s) (all old builds except the newest $KEEPVERSIONS). Press ctrl-c to cancel or any key to continue"
  rm -rf $DELDIRS
fi
