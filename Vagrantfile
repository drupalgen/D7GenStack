# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "chef/debian-7.7"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.200.100"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Initial shell configurations
  config.vm.provision :shell do |shell|
  shell.inline = 
    "sudo apt-get update;
    sudo apt-get upgrade -y;
    sudo apt-get install puppet git vim curl wget sudo -y;
    mkdir -p /etc/puppet/modules;"
  end

  #Puppet Provisioner
  #
  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "manifests"
     puppet.module_path = "modules"
     puppet.manifest_file  = "init.pp"
  end

  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "manifests"
     puppet.module_path = "modules"
     puppet.manifest_file  = "apache.pp"
  end

  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "manifests"
     puppet.module_path = "modules"
     puppet.manifest_file  = "mysql.pp"
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file = "drupal.pp"
  end
end
