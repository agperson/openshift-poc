class ec2::mgmt extends ec2 {
  # Dependencies for puppet cloud provisioner
  $pkgs = [ 'ruby-devel', 'gcc', 'rubygems', 'libxml2-devel', 'libxslt-devel', 'rubygems-json' ]
  $gems = [ 'guid', 'json', 'nokogiri' ]
  package { $pkgs: }
  package { $gems: 
    ensure   => installed,
    require  => Package[$pkgs],
    provider => gem,
  }

  Package['nokogiri'] {
    version => '1.5.10',
  }

  # Instance creation script
  package { [ 'trollop', 'colored' ]:
    ensure   => 'installed',
    provider => 'gem',
  }

  file { '/usr/sbin/oo-create-instance':
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
    source => 'puppet:///dist/ec2/usr/sbin/oo-create-instance',
}
