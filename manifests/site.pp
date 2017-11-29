node default {
}
node 'master.puppet.vm' {
  include role::master_server
  file { '/root/README':
    ensure => file,
    content => $fqdn,
  }
}
