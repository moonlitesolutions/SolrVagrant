# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 8000]
  end

  config.vm.box_check_update = true
  config.ssh.insert_key = false
  config.vm.network "forwarded_port", guest: 9521, host: 9521
  config.vm.network "forwarded_port", guest: 9600, host: 9600

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/plays/playbook.yml"
    ansible.install = true
    ansible.verbose = false
    ansible.raw_arguments  = [
      #'--extra-vars "git_repo=https://github.com/nickvasilyev/SolrClient.git mirror=/vagrant/ code_dir=/home/vagrant/code"'
      '--extra-vars "git_repo=https://github.com/nickvasilyev/SolrClient.git mirror=http://archive.apache.org/dist/lucene code_dir=/home/vagrant/code"'
    ]
  end
end
