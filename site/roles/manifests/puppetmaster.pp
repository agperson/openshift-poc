class roles::puppetmaster {
  class { 'hiera':
    hierarchy  => [ 'common' ],
    hiera_yaml => '/etc/puppet/hiera.yaml',
    datadir    => '/etc/puppet/hieradata',
    owner      => 'puppet',
    group      => 'puppet',
  }

  $modulepath = [
    '/etc/puppet/env/$environment/modules',
    '/etc/puppet/env/$environment/dist',
    '/etc/puppet/env/$environment/site',
  ]

  class { 'puppet::server':
    servertype         => 'standalone',
    modulepath         => $::roles::puppetmaster::modulepath,
    manifest           => '/etc/puppet/env/$environment/site.pp',
    config_version_cmd => '/usr/bin/git --git-dir /etc/puppet/env/$environment/.git rev-parse --short HEAD 2>/dev/null || echo',
    ca                 => true,
  }
}
