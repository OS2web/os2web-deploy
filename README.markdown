Oprettelse af OS2Dagsorden løsning
==================================

Forudsætninger
--------------

* 0. En Ubuntu / Debian installation
* 1. En git konto med adgang til repositoriet. http://help.github.com/linux-set-up-git/ (vil være offentlig efter frigivelsen)
* 2. Drupal oprettelses script. /usr/local/sbin/create_site_with_db.php
(findes på https://github.com/os2web/create_site_with_db)
* 3. Os2web-deploy build filerne
* 4. Rettigheder til www-data (tilføjes med "sudo adduser [brugernavn] www-data). Husk at logge ud.
* 5. Drush make skal være installeret. http://drupal.org/project/drush_make (drush dl drush_make-6.x)
* 6. Apache 2.x with mod_rewrite
* 7. PHP 5.2.X and APC or XCache
* 8. MySQL 5.X
* 9. Opfylde http://drupal.org/requirements
* 10. PHP `memory_limit` must be at least `128M` (128MB)
* 11. PHP `max_execution_time` must be at least `60` (1 minute)
* 12. En  RSA nøgle til din GIT konto (vejledning: https://help.github.com/articles/generating-ssh-keys)

INSTALLATION
============

Ubuntu / Debian opsætning
-------------------------
sudo apt-get install apache2 php5 mysql-server phpmyadmin pwgen drush php5-ldap git

Git-flow (valgfri)
--------
Kommer senere

Scripts
-------
* os2dagsorden_build.py til nye installationer eller en komplet pull
* reroll.sh bruges når der skal opdateres fra master branch i git
* dev-reroll.sh bruges når der skal opdateres fra udviklings branchen

Det udføres ved at man cd'er ind i diret og udfører kommandoen ./reroll.sh, dev-reroll.sh eller os2dagsorden_build.py

Oprettelse af site folder og database m.m.
------------------------------------------
Kør drupal oprettelses scriptet med angivelse af domane navnet på det site du vil oprette
HUSK: Du skal selv skrive dit mysql root kodeord ind i filen i variablen $mysqlpasswd

* SSH til serveren inclusiv din git nøgle "ssh -A [server_navn]"
* Udfør "cd /var/www/"
* Udfør "git clone https://github.com/OS2web/os2dagsorden-deploy.git"
* Udfør "cd os2dagsorden-deploy"
* Udfør og ret kodeordet for mysql "vim ./create_site_with_db.php" og gem ved at trykke ESC og herefter :q! + ENTER
* Udfør "sudo ./create_site_with_db.php [dit domane]"

Deployment af koden fra GITHub
------------------------------

* Udfør "cd /var/www/os2dagsorden-deploy"

Kør python scriptet fra det dir som filen ligger i os2dagsorden-deploy folderen

* Udfør: "python os2dagsorden_build.py -D os2dagsorden.dev.make"
* Udfør: "./reroll-dev.sh" - så vi får oprettet "latest" linket i /build/ folderen

Installer Drupal
----------------

Fra den nye site folder Installer Drupal 7 med drush /var/www/[sitenavn]/
* Udfør: "drush dl drupal-7.x"
* Udfør: "rm -rf public_html"
* Udfør: "mv drupal-7.x-dev/ public_html"

Opret et symbolsk link til build folderen. 
* Udfør: "cd public_html"
* Udfør: "ln -s /var/www/os2dagsorden-deploy/build/latest profiles/os2dagsorden" (fra document / drupal root)

Gå på url'en og installer drupal færdig. Eller brug denne
* Udfør: "drush site-install os2dagsorden --account-name=admin --account-pass=admin --db-url=mysql://[db_bruger]:[db_passwd]@localhost/[db]"

Proceduren er at reroll.sh bruges når prod sitet skal reetableres, eller hvis alt fra dev branch er blevet opdateret til master branch. 


PDF2HTML
========
Nedenstående er installations vejledninger til PDF2HTML som er nødvendige ved installation på Debian Linux.
Installation på Ubuntu linux skulle være lige ud af landevejen. Da alle pakker er inkluderet i denne distribution. 
(om et halvt års tid er de nok også med i Debian. Der blot er lidt mere konservativ med nye pakker og aftestning)

Installation
------------

Kontrol
-------
Søg for at ingen at de pakker vi compiler selv er installeet
* sudo dpkg -l | grep poppler
* sudo dpkg -l | grep fontforge

installer build stuff
---------------------
* sudo apt-get install build-essential pkg-config cmake
* sudo apt-get install libpng12-dev libpng3 
* sudo apt-get build-dep fontforge
* sudo apt-get build-dep libpoppler-dev
* sudo mkdir src && cd src
* sudo wget http://poppler.freedesktop.org/poppler-0.20.4.tar.gz

Pak ud og configure med:
------------------------
* sudo tar -xvzf poppler-0.20.4.tar.gz
* cd poppler-0.20.4
* sudo ./configure --enable-xpdf-headers --enable-zlib --disable-static
* sudo make
* sudo make install

Download fontforge fra:
-----------------------
* http://sourceforge.net/projects/fontforge/files/fontforge-source/
* Brug gerne nedenstående direkte link, men husk at se efter om der er kommet en nyere version.
* Udfør "sudo wget http://switch.dl.sourceforge.net/project/fontforge/fontforge-source/fontforge_full-20120731-b.tar.bz2"
* tar -xvjf fontforge_full-20120731-b.tar.bz2
* cd fontforge-20120731-b
* sudo ./configure --disable-static --without-python
* sudo make
* sudo make install

Opgrader til gcc4.7
-------------------
Dette opgraderer gcc og libc på systemet til versionerne fra testing. Gør det på eget ansvar.
Lav /etc/apt/sources.list.d/testing.list med dette indhold:
* # used for gcc upgrade
* deb http://ftp.dk.debian.org/debian/ testing main
* Udfør: sudo apt-get update
* Udfør: sudo apt-get install gcc-4.7 g++-4.7
* Fjern /etc/apt/sources.list.d/testing.list igen
* rm /etc/apt/sources.list.d/testing.list

Hent pdf2html
-------------
* cd ..
* sudo git clone git://github.com/coolwanglu/pdf2htmlEX.git
* sudo cd pdf2htmlEX
* sudo cmake .
* sudo make
* sudo make install

CRON
====
# syddjurs cron
10,25,40,55 * * * * wget -O - -q -t 1 
'http://10.255.1.46/cron.php?cron_key=WZYgGQTXMIokivcN_eJQbubbNE4DQldSZsfQD7-Jke4'

0,15,30,45 * * * * rsync -urp --exclude Batch /mnt/AcadreMMNotify/ 
/var/www/syddjurs.dk/public_html/sites/default/files/acadre/

Acadre mount eksempel linie til mount i /etc/fstab (kræver "apt-get install cifs-tools")
//[ip/servernavn]/[folder på acadre server] [local folder] cifs username=USERNAME,password=PASSWORD,ro,error=remount-ro 0 0 

Konfigurering
=============
p.t. lige i note-form

XML eksempel filer
------------------
1. xml import fra /cron
Der skal bruges 3 excell filer hvis ikke der stilles SOFD webservice til rådighed. 
Disse placeres i: sites/default/files/acadre_views directory, med navnene:
* V_web_AcadreGroups.xml
* V_web_MeetingGroups.xml
* V_web_Meetings.xml

Importen køres fra cron admin/config/system/cron, med OS2Dagsorden importer module

Adlib server
-----------
Ændring af Adlib webservice: sites/all/modules/os2dagsorden_adlib_api/includes/AbLibWS.class.inc

Import af Dagsordener og referater. I Acadre format
---------------------------------------------------
kopier alle filerne ind i sites/default/files/acadre direktørier 
sæt ejer og rettigheder til www-data
Kør "OS2Dagsorden Meeting import fra admin/config/system/cron

HTML convertering
-----------------
4. start html convertion
could be started using cron OS2Dagsorden PDF to HTML converter
makes sense to start after acadre meeting create (if the meeting had any PDF files, they'll be converted to HTML on this run), or after you run Adlib cron (OS2Dagsorden AdLib API Module) at least two times (on to schedule the jobs on Adlib server, and second to fetch the PDF files). Then this run will converted fetched PDF files to HTML.

Logning
-----------
logning kan ses på admin/config/development/logging

Url encoding
-------------
Bullet point oversigten med en "ikke pæn url "?q=meeting/1234/bullet-point/1235" duer ikke (pga den opbrudte url
Når url'en ændres til den omskrevne / brugervenlige url som alle bruger vil det være i orden.

Privat dircetory ændringer 
--------------------------
* sættes til "sites/default/files/acadre"
* "Default download method" sættes til "Private local files served by Drupal"
* 

Oprydning
=========
Efter endt installation kan src biblioteket fjernes. 
* Udfør "cd"
* Udfør "sudo rm -rf src"

Fejlfinding
===========

Build FAILED for mode "profile" drush
-----------------------------------------
Hvis du får denne fejl når du kører reroll.sh eller ....

Unable to clone
---------------

 >> Unable to clone cmstheme from git@github.com:syddjurs/cmstheme.git.
 >> Unable to clone os2web from git@github.com:syddjurs/os2web.git.
ERROR: Build FAILED for mode "profile" in folder "build/os2web-dev-201209041841" (18:43:44)
*Løsning* Installer drush_make som beskrevet ovenfor. 

Required modules not found
--------------------------

The following modules are required but were not found. Move them into the appropriate modules subdirectory, such as sites/all/modules. Missing modules: Features_tools,Devel_generate

*løsning* kør "drush dl ftools" og "drush dl devel" (evt. også "drush en ftools" og drush en devel")

Maximum execution time of xx seconds exceeded
---------------------------------------------

PHP Fatal error:  Maximum execution time of 30 seconds exceeded in /var/www-sydd/base/includes/bootstrap.inc on line 3265, 
*Løsning* Set max execution time til f.eks 600 i "/etc/php5/apache2/php.ini". "vim cat /etc/php5/apache2/php.ini"

Fontforge mangler URI
---------------------
Hvis du får denne fejl ved installation af Fontforge "You must put some 'source' URIs in your sources.list" skal følgende tilføjes til Til debian i /etc/apt/sources.list.d/squeeze-src.list

* Tilføj "deb-src http://ftp.dk.debian.org/debian/ squeeze main"
* Udfør : "apt-get update" bagefter

Permission denied ved hentning af deploy
----------------------------------------
Hvis du får "fatal: could not create work tree dir 'os2dagsorden-deploy'.: Permission denied" skal nedenstående rettigheder sættes på /var/www folderen
* Udfør "chmod g+rwX /var/www/"
* Udfør "chown -R root.www-data /var/www/"

PHP 5.4 rettelser
-----------------
PHP Warning:  PHP Startup: Unable to load dynamic library '/usr/lib/php5/20100525/suhosin.so' - /usr/lib/php5/20100525/suhosin.so: cannot open shared object file: No such file or directory in Unknown on line 0
php5-suhosin bruges ikke længere fra PHP 5.4 og frem. Fjern filen med navnet xx-suhosin.ini fra /etc/php5/conf.d/.

No LDAP - ved installation af drupal
------------------------------------
WD php: Exception: LDAP Extension Loaded: Failed
php5-ldap modulet er ikke installeret