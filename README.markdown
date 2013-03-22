Dokumentationen til projektet finde her https://github.com/OS2web/os2web-deploy/wiki


Installation
---------------

Install an OS2web Installation via .make

1. Install Drush http://drupal.org/projects/drush
2. cd [site dir]
3. drush dl drupal-7.x
4. mv drupal-7.x public_html
5. git clone git@github.com:OS2web/os2web-deploy.git -b feature/recursive-make
6. cd public_html/profiles
7. ln -s ../../os2web-deploy os2web

Reroll the modules and contrib modules specified in os2web.make:
- `./reroll.sh` or `./reroll-dev.sh`
