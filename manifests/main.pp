# == Main
#
# Install and configure default services to project Saraiva.com.
# === Authors
#
# Valdir Calixto
# valdir.calixto@e-smart.com.br
# === Copyright
#
# Copyright 2014 e-smart Commerce do Brasil, unless otherwise noted.
#
class apt_update {
    exec { "aptGetUpdate":
        command => "sudo apt-get update",
        path => ["/bin", "/usr/bin"]
    }
}

class othertools {
    package { "vim-common":
        ensure => latest,
        require => Exec["aptGetUpdate"]
    }

    package { "curl":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }

    package { "htop":
        ensure => present,
        require => Exec["aptGetUpdate"]
    }
}


class { 'nginx': }
class { 'php': }
class { 'mysql': }
class { 'varnish': }
class { 'redis': }
#class { 'solr': }


include apt_update
include othertools
include nginx
include php
include mysql
include varnish
include redis
#include solr
