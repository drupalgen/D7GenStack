
Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
}

package {'php5':
  ensure => present,
}

package {'php5-gd':
  ensure => present,
  require => Package['php5'],
}

package {'php-pear':
  ensure => present,
  require => Package['php5'],
}

package {'php5-curl':
  ensure => present,
  require => Package['php5'],
}

package {'php5-mcrypt':
  ensure => present,
  require => Package['php5'],
}

package {'php5-common':
  ensure => present,
  require => Package['php5'],
}

package {'php5-dev':
  ensure => present,
  require => Package['php5'],
}

package {'php5-mysql':
  ensure => present,
  require => Package['php5'],
}

package {'php5-memcache':
  ensure => present,
  require => Package['php5'],
}
