# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  #To use on vagrant 1.8.1 install this pathc
  #https://github.com/mitchellh/vagrant/commit/c2c1a443fdd6bb174183c7ee97d01e39db9a8581#diff-c379a6054318dfc48824835501d40778

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 8000]
  end

  config.vm.box_check_update = true
  config.ssh.insert_key = false

  config.vm.network "forwarded_port", guest: 9521, host: 9521
  config.vm.network "forwarded_port", guest: 9531, host: 9531
  config.vm.network "forwarded_port", guest: 9541, host: 9541
  config.vm.network "forwarded_port", guest: 9551, host: 9551
  config.vm.network "forwarded_port", guest: 9600, host: 9600

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/plays/playbook.yml"
    ansible.install = true
    ansible.verbose = false
    ansible.raw_arguments  = [
      '--extra-vars "git_repo=https://github.com/nickvasilyev/SolrClient.git mirror=/vagrant/ code_dir=/vagrant/"'
      #'--extra-vars "git_repo=https://github.com/nickvasilyev/SolrClient.git mirror=http://archive.apache.org/dist/lucene code_dir=/home/vagrant/code"'
    ]
  end
end
