class roles::base {
  include base::pkgs
  include base::users

  class { 'puppet::agent':
    server => 'puppetmaster.oo.huit.harvard.edu',
    method => 'service',
  }
}
