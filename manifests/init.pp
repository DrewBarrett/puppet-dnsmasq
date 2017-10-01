# == Class: dnsmasq
class dnsmasq ($domains = []) {

  package { 'dnsmasq':
    ensure => 'present'
  }

  service { 'dnsmasq':
    ensure => 'running',
    enable => true,
  }

  file { '/etc/dnsmasq.conf':
    ensure  => file,
    content => template('dnsmasq/dnsmasq.conf.erb'),
    notify  => Service['dnsmasq']
  }

}
