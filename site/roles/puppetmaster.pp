class roles::puppetmaster {
  class { 'puppet::server':
    servertype   => 'standalone',
    manifest     => '/etc/puppet/manifests/site.pp',
    ca           => true,
  }
}
