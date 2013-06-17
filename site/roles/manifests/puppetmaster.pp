class roles::puppetmaster {
  class { 'hiera':
    hierarchy  => [ 'common' ],
    hiera_yaml => '/etc/puppet/hiera.yaml',
    datadir    => '/etc/puppet/hieradata',
    owner      => 'puppet',
    group      => 'puppet',
  }

  class { 'puppet::server':
    servertype   => 'standalone',
    modulepath   => '/etc/puppet/env/$environment/modules:/etc/puppet/env/$environment/dist:/etc/puppet/env/$environment/site',
    manifest     => '/etc/puppet/manifests/site.pp',
    ca           => true,
  }
}
