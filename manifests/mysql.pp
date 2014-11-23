Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
}

package {'mysql-server':
  ensure => 'present',
}

service {'mysql':
  ensure => 'running',
  require => Package['mysql-server'],
}

exec {'create-drupal-db':
  command => "mysql -u root -e 'create database drupal'",
  require => Service['mysql'],
}

exec {'create-drupal-dbuser':
  command => "mysql -u root -e 'grant all on drupal.* to drupaluser@localhost identified by \"1drupaluser\";'",
  require => Exec['create-drupal-db'],
}

exec {'increase-php-memory':
  command => "sudo /bin/sed -i 's/^memory_limit = 128M/memory_limit = 1024M/' /etc/php5/apache2/php.ini",
}  
