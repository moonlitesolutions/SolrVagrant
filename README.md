# SolrVagrant

Vagrant Config for Solr Testing

I made this to make it easier to test SolrClient python library with multiple versions of Solr. However, I think this can have other uses, so I am putting it up on github as it's own repo.

This vagrant + ansible rig will set up zookeepers, and several versions of solr listed in ansible/plays/playbook.yml (at the end).

Zookeepers go into /opt/zk1, zk2, zk3.

Solrs will go into /opt/solrs/VERSION (eg. 5.2.1)

The port for solr is 9 and the version number. So 5.2.1 will listen on 9521, 5.3.1 will listen on 9531, 6.0.0 will listen on 9600, etc...

To use it:
1. Clone this repo
2. Edit the `Vagrantfile`, find this line and replace it with your branch.

		ansible.raw_arguments  = [
      	'--extra-vars "git_repo=https://github.com/nickvasilyev/SolrClient.git"'
    	]
2. run `vagrant up` to kick off the installation / configuration. It will take a while.
3. run `vagrant ssh` to get into the box
4. The code from the git repo will be in ~/code/
5. Do what you want with the solrs.


Note:
If you think you will need to vagrant up from scratch more than once, I recommend you download all solr tgz packages locally.
To do this:

1. In the extra vars passed to ansible. change the mirror from http://archive.apache.org/dist/lucene to /vagrant/
2. Create a `solr` directory on the root of SolrVagrant and put all the versions in there for example:
   - SolrVagrant/solr/5.2.1/solr-5.2.1.tgz
   - SolrVagrant/solr/5.3.1/solr-5.3.1.tgz
   - etc...

 This will use the downloaded pacakges instead of pulling them from apache mirrors.
