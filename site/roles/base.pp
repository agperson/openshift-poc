class roles::base {
  package { ['vim-enhanced', 'tmux', 'elinks', 'htop', 'nc' ]: }

  group { 'dsilverman':
    gid => 501,
  }

  user { 'dsilverman':
    uid   => '500',
    gid   => '501',
    home  => '/home/dsilverman',
  }

  ssh_authorized_key { 'dsilverman@pegasus':
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDuoa641/xNQmgH/6g/Ic+NKJT35rKCRVcWXVeVf01etuD2U0gH4Qy4pmWo2D5ydEStq9zkIW70QTbU1oyHnR9xjwCECsDDblALqRwCxulPpH0eVOoINlUgHfu3q76xkNvVQXGUw5qBpE+UPIc6W4UhqwooccyudHenSrQ44e7vEyc6koGvFh6JtLPNLMkrUzHr/lVR/V3hnla25pDApL1T/lM7boYbohxLhHNY6sgrgeCvkehVygndTbCMfYXjWrC2M/TioBf+5GR7s/nhDtIuUOUbHleAYswTv99iuH0O1VJIdfZsG9hkv72NyQCVAUfF4GEKFWMHOLKiqt/yFVJ/',
    type => 'ssh-rsa',
    user => 'dsilverman',
  }
}
