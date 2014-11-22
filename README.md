D7GenStack
==========

Vagrant profile and Puppet manifest for the technology stack used for development of DrupalGen-7

This stack builds a VirtualBox machine with 2048M RAM using Debian 7.7.

The base box is the Debian 7.7 box from the Bento project, configured for private network IP of 192.168.200.100, listining on the default ports assigned by Vagrant.

Puppet is used to configure the box, and puppet manifests have been included to build the following setup:

