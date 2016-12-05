#!/bin/bash
mkdir solr
cd solr
mirror="http://archive.apache.org/dist/lucene"
for s in '5.2.1' '5.5.3' '6.2.1' '6.3.0'
do
 mkdir $s
 cd $s
 echo "Downloading $s from  $mirror/solr/$s/solr-$s.tgz"
 wget $mirror/solr/$s/solr-$s.tgz
 cd ..
done
