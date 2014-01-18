# == Class: mysql
#
# Install and configure basic mysql.
# === Authors
#
# Valdir Calixto
# valdir.calixto@e-smart.com.br
# === Copyright
#
# Copyright 2014 e-smart Commerce do Brasil, unless otherwise noted.
#

class mysql{
  $password = "casa"
  package { "mysql-server": ensure => present }
  
  exec { "Set mysql-server root password":
    subscribe => [ Package["mysql-server"]],
    refreshonly => true,
    unless => "mysqladmin -uroot -p$password status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password $password",
 }
 
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }
}
