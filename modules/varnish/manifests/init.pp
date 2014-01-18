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
   package { "varnish": ensure => present }
   service { "varnish":
     ensure => running,
     require => Package["varnish"],
}
}
