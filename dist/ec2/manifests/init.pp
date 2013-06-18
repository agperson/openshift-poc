class ec2 {
  package { 'fog':
    ensure   => 'installed',
    provider => 'gem',
  }
  
  ## TODO: Install ec2-api-tools (not available as RPM)
}
