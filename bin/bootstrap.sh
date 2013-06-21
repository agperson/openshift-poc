#!/bin/sh
# Bootstrap new Puppetmaster
# - Create a new m1.small instance of type ami-52009e3b
# - SCP this script and run it as root

rpm -i http://yum.puppetlabs.com/el/6Server/products/x86_64/puppetlabs-release-6-7.noarch.rpm
yum install git rubygems ruby-devel gcc libxml2-devel libxslt-devel puppet
gem install librarian-puppet
git clone http://github.com/huit/openshift-poc.git
cd openshift-poc
librarian-puppet install
puppet apply -v --modulepath=dist:modules:site -e 'include profiles::puppetmaster'
mkdir -p /etc/facter/facts.d/
echo "oo_role=puppetmaster" > /etc/facter/facts.d/oo_role.txt
