class ec2::mgmt inherits ec2 {
  # Dependencies for puppet cloud provisioner and instance creation script
  $pkgs = [ 'ruby-devel', 'gcc', 'rubygems', 'libxml2-devel', 'libxslt-devel',
            'rubygems-json' ]
  $gems = [ 'guid', 'json', 'trollop', 'colored']
  package { $pkgs:
    ensure => installed,
  }

  package { $gems:
    ensure   => installed,
    require  => Package[$pkgs],
    provider => 'gem',
  }

  package { 'nokogiri':
    ensure   => '1.5.10',
    require  => Package[$pkgs],
    provider => 'gem',
  }

  # Instance creation script
  file { '/usr/sbin/oo-create-instance':
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
    source => 'puppet:///dist/ec2/usr/sbin/oo-create-instance',
  }
}
