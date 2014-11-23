D7GenStack
==========

Vagrant profile and Puppet manifest for the technology stack used for development of DrupalGen-7.

This stack builds a VirtualBox machine with 2048M RAM using Debian 7.7.

The base box is the Debian 7.7 box from the Bento project, configured for private network IP of 192.168.200.100, listining on the default ports assigned by Vagrant.  This, of course, means the user/password for running sudo commands is "vagrant/vagrant".

A combination of the shell provisioner and Puppet is used to provision the box, and shell commands and puppet manifests have been included to build the following setup (with dependencies):

* sudo
* git
* curl
* vim
* puppet
* Apache2
  * mod-rewrite
  * Local host created with the server name of "d7gen.local.com", pointed at port 80.  You can set up an entry in your local hosts file pointing d7gen.local.com to 192.168.200.100 to see the drupal installation in your browser.
* mysql (server and client) (NOTE:  THIS IS UNSECURED, WITH NO PASSWORD ON THE ROOT USER)
*   Drupal database "drupal", with user/password of "drupaluser/1drupaluser"
* php5
  * php5-gd
  * php5-curl
  * php-pear
  * php5-mcrypt
  * php5-memcache (installed for now, may do something with it later)
* Composer
* Drush
* Drupal Core with a drush install
  * superuser admin/admin 

Getting Started
===============
To start, clone this repository, go into the root of the clone, and run "vagrant up".

Once vagrant has completed, cd drupal/public_html/sites/all/modules and run:

  git clone git@github.com:lhridley/DrupalGen-7.git custom

This will clone the DrupalGen project into the sites/all/modules/custom directory of the Drupal install.

Notes
=====
All commits to the DrupalGen project should be done from inside that directory.

All commits to the Vagrant profile should be done here.

To save and restart your VirtualBox, run:

  vagrant suspend

  vagrant resume

If you reprovision, you will destroy the Drupal installation and create a new one.
