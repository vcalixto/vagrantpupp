# == Class: nginx
#
# Install and configure basic nginx.
# === Authors
#
# Valdir Calixto
# valdir.calixto@e-smart.com.br
# === Copyright
#
# Copyright 2014 e-smart Commerce do Brasil, unless otherwise noted.
#

class nginx
{

package { 'nginx': 
        ensure => latest,
        require => Exec['aptGetUpdate'],
}

package { 'php5-fpm':
        ensure => present,
        require => Exec['aptGetUpdate'],
}

service { 'nginx':
        ensure => running,
        require => Package['nginx'],
}

service { 'php5-fpm':
        ensure => running,
        require => Package['php5-fpm'],
}

file { 'vagrant-nginx':
        path => '/etc/nginx/sites-available/saraiva.com',
        ensure => file,
    replace => true,
        require => Package['nginx'],
        source => 'puppet:///modules/nginx/nginx.conf',
    notify => Service['nginx'],
}

file { 'default-nginx-disable':
        path => '/etc/nginx/sites-enabled/default',
        ensure => absent,
        require => Package['nginx'],
}

file { 'vagrant-nginx-enable':
        path => '/etc/nginx/sites-enabled/saraiva.com',
        target => '/etc/nginx/sites-available/saraiva.com',
        ensure => link,
        notify => Service['nginx'],
        require => [
                File['vagrant-nginx'],
                File['default-nginx-disable'],
        ],
}
}
