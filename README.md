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
* Puppet modules:
  * puppetlabs/apache
  * example42-php
  * puppetlabs-mysql
* Apache2
  * mod-rewrite
  * Local host created with the name of "http://d7gen.local.com", pointed at port 80.  You can set up an entry in your local hosts file pointing d7gen.local.com to 192.168.200.100 to see the drupal installation in your local browser.
* mysql
*   Drupal database "drupal", with user/password of 
* php5
  * php5-gd
  * php5-curl
  * php-pear
  * php5-mcrypt
  * php5-memcache (installed for now, may do something with it later)
  * 
  * 

