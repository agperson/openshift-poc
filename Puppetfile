forge 'http://forge.puppetlabs.com'

# Configure Puppetmaster and clients
# Note: r10k, unlike librarian-puppet, does not manage dependencies
mod "ploperations/puppet"

mod "puppetlabs/stdlib"
mod "ripienaar/concat"
mod "ploperations/unicorn"
mod "ploperations/bundler"
mod "ploperations/interval"
mod "stahnma/puppetlabs_yum"

# Basic hiera
mod "hunner/hiera"

# r10k + Red Hat additions
mod "r10k", 
  :git => "https://github.com/agperson/puppet-r10k.git"

# Provision hosts on EC2 from Puppetmaster
mod "cloud_provisioner",
  :git => "git://github.com/puppetlabs/puppetlabs-cloud_provisioner.git"
