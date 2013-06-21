class roles::broker {
  class { 'openshift_origin' :
    node_fqdn                  => $::fqdn,
    cloud_domain               => 'oo.huit.harvard.edu',
    dns_servers                => ['172.16.0.23'],
    os_unmanaged_users         => ['ec2-user', 'dsilverman'],
    enable_network_services    => false,
    configure_firewall         => true,
    configure_ntp              => true,
    configure_activemq         => false,
    configure_mongodb          => false,
    configure_named            => false,
    configure_avahi            => false,
    configure_broker           => true,
    configure_node             => false,
    configure_fs_quotas        => false,
    broker_auth_plugin         => 'basic-auth',
    development_mode           => true,
    update_network_dns_servers => false,
    avahi_ipaddress            => '127.0.0.1',
    broker_dns_plugin          => 'avahi',
  }

  # FIXME: Config for Route53
}
