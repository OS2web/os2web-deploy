#!/bin/sh

##### Drupal deploy script made in shell
# - Makes build with drush make
# - Moves latest build to dev-latest
# - Backup database
# - Update database with drush updb
# - Clear cache
#
# ## Multisite?
# Run the script with URI infront:
# URI=http://domain.tld ./reroll.sh
#
# Author: Anders Bryrup (andersbryrup@gmail.com)

DATE=`date +%Y%m%d%H%M`

# The newly builed dir
BUILD_DIR=dev-$DATE
# The previous build dir
BUILD_DIR_PREV=dev-previous
# The build dir with latest build
BUILD_DIR_LATEST=dev-latest

# The Source Profile name
# This is a special case, where multiple profiles are in same dir.
# [name].install
# [name].profile
# [name].info
PROFILE_SRC=os2web.core
# The destination Profile name
PROFILE_DST=os2web

# The root dir of your drupal instance. Used by drush!
DRUPAL_ROOT=$(dirname `pwd`)/public_html

mkdir -p build/$BUILD_DIR

drush make --no-gitinfofile -y --no-core --working-copy --contrib-destination=build/$BUILD_DIR $PROFILE_SRC.dev.make

### Code below can be in seperate file. source execute file from here. ###
# . ./deploy.sh

if [ -d "build/$BUILD_DIR/modules" ]; then
	# Drush make completed without errors. If modules doesnt exist, drush make failed.

	# Lets copy our drupal profile files
	cp $PROFILE_SRC.info build/$BUILD_DIR/$PROFILE_DST.info
	cp $PROFILE_SRC.profile build/$BUILD_DIR/$PROFILE_DST.profile
	cp $PROFILE_SRC.install build/$BUILD_DIR/$PROFILE_DST.install
	cp $PROFILE_SRC.sql.gz build/$BUILD_DIR/db.sql.gz

	# Move old build to previous
	unlink build/$BUILD_DIR_PREV
	mv build/$BUILD_DIR_LATEST build/$BUILD_DIR_PREV
	# Make new build the latest
	ln -sf $BUILD_DIR build/$BUILD_DIR_LATEST

	# Take a copy of the current database,
	# and put it in the previous build. Code and database keeps together.
	echo "Backing up the database..."
		# TODO: skip basic tables like cache --structure-tables-key=#{tables}
		# Will make the dump smaller.
	drush sql-dump --root=$DRUPAL_ROOT --uri=$URI --gzip > build/$BUILD_DIR_PREV/sql-dump.$DATE.sql.gz

	echo "Updating database... Site will go in maintenance mode!"
	drush --root=$DRUPAL_ROOT --uri=$URI vset maintenance_mode 1
	drush --root=$DRUPAL_ROOT --uri=$URI updb

	# # Any additionally drush commands?

	# Finnally clear the cache
	echo "Clearing cache..."
	drush --root=$DRUPAL_ROOT --uri=$URI cc registry
	drush --root=$DRUPAL_ROOT --uri=$URI cc all

	drush --root=$DRUPAL_ROOT --uri=$URI vset maintenance_mode 0

	echo "Deploy Complete. End of maintenance mode!"
else
	# Build failed, remove build
	rm -rf build/$BUILD_DIR
	echo "Build Failed. Deploy terminated"
fi
