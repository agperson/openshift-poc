node default {
  case $::oo_role {
    'puppetmaster': { include profiles::puppetmaster }
    'broker':       { include profiles::broker }
    'node':         { include profiles::node }
    'bsn':          { include profiles::bsn }
    default:        { fail("Invalid or undefined oo_role (${::oo_role}).") }
  }
}
