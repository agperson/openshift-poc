node default {
  case ::$oo_role {
    'puppetmaster': { include profiles::puppetmaster }
    'broker':       { include profiles::broker }
    'node':         { include profiles::node }
    'bsn':          { include profiles::bsn }
  }
}
