# == Class: php
#
# Install and configure default PHP.
# === Authors
#
# Valdir Calixto
# valdir.calixto@e-smart.com.br
# === Copyright
#
# Copyright 2014 e-smart Commerce do Brasil, unless otherwise noted.
#
class php{
 
  package { "php5":
    ensure => present,
  }

  package { "php5-common":
    ensure => present,
  }
 
  package { "php5-cli":
    ensure => present,
  }

  package { "php5-gd":
     ensure => present,
  }
 
  package { "php5-mysql":
    ensure => present,
  }
 
  package { "php5-imagick":
    ensure => present,
  }
 
  package { "php5-mcrypt":
    ensure => present,
  }
 
  package { "php-pear":
    ensure => present,
  }
 
  package { "php5-dev":
    ensure => present,
  }
 
  package { "php5-curl":
    ensure => present,
  }
 
  package { "php5-sqlite":
    ensure => present,
  }

}
