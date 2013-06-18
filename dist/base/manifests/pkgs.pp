class base::pkgs {
  package { [ 'git', 'tmux', 'vim-enhanced', 'elinks', 'htop' ]:
    ensure => installed,
  }
}
