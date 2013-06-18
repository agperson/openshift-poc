class profiles::openshift::puppetmaster {
  include roles::base
  include roles::puppetmaster
  include roles::ec2_mgmt
}
