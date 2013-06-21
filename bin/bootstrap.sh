#!/bin/sh
# Bootstrap new Puppetmaster
# - Create a new m1.small instance of type ami-52009e3b
# - SCP this script and run it as root

if [[ "$1" == "" ]]; then
  echo "Please provide a pre-registered FQDN for this host (i.e. puppetmaster.domain)"
  exit 1
fi

host="$1"

# Setup Puppet Labs Yum Repo
rpm -i http://yum.puppetlabs.com/el/6Server/products/x86_64/puppetlabs-release-6-7.noarch.rpm

# Install dependencies
yum install git rubygems ruby-devel gcc libxml2-devel libxslt-devel puppet
gem install --no-rdoc --no-ri librarian-puppet

# Setup role for future runs
mkdir -p /etc/facter/facts.d/
echo "oo_role=puppetmaster" > /etc/facter/facts.d/oo_role.txt

# Aggressively set hostname for future cert signing
hostname $host
echo "$host" > /etc/hostname
echo "HOSTNAME=$host" >> /etc/sysconfig/network
service network restart

# Copy Puppet repo to a temporary location
git clone http://github.com/huit/openshift-poc.git
cd openshift-poc

# Install modules for a bootstrap run
librarian-puppet install

# Run Puppet
puppet apply -v --modulepath=dist:modules:site site.pp

# Kick-off r10k first run
r10k synchronize -v

# Clean up
rm -r openshift-poc

echo "Puppetmaster has been bootstrapped and should be ready to go!"
exit 0
