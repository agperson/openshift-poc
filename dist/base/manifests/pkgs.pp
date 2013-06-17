class base::pkgs {
  package { [ 'tmux', 'vim-enhanced', 'elinks', 'htop' ]:
    ensure => installed,
  }
}
