# == Class: Varnish
#
# Install and configure default Varnish.
# === Authors
#
# Valdir Calixto
# valdir.calixto@e-smart.com.br
# === Copyright
#
# Copyright 2014 e-smart Commerce do Brasil, unless otherwise noted.
#
class varnish{
   package { "varnish": 
   ensure => present,
   require => Exec['aptGetUpdate'],
    }

   service { "varnish":
     ensure => running,
     require => Package["varnish"],
}

file { 'vagrant-varnish':
        path => '/etc/varnish/default.vcl',
        ensure => file,
    	replace => true,
        require => Package['varnish'],
        source => 'puppet:///modules/varnish/magento.vcl',
    	notify => Service['varnish'],
    }

file { 'varnish-daemon':
        path => '/etc/default/varnish',
        ensure => file,
    	replace => true,
        require => Package['varnish'],
        source => 'puppet:///modules/varnish/daemon.conf',
    	notify => Service['varnish'],
    }

}
