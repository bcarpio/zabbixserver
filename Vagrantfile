# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.5"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Using Puppet Labs official vagrant boxes, from: https://vagrantcloud.com/puppetlabs
  config.vm.box = "puppetlabs/centos-6.6-64-puppet"

  config.vm.provision :shell, :path => "./.vagrant_puppet/init.sh"

  config.vm.network "forwarded_port", guest: 80, host:8080

  config.vm.provision :puppet do |puppet|
    puppet.environment = "production"
    puppet.environment_path = "environments"
    puppet.manifests_path = "./.vagrant_puppet"
    puppet.manifest_file  = "init.pp"
    puppet.options = "--verbose"
  end

end
