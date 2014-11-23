package {'apache2':
  ensure => present,
}

exec {'enable-mod-rewrite':
  command => '/usr/bin/sudo /usr/sbin/a2enmod rewrite',
  require => Package['apache2'],
}

exec {'enable-mod-php5':
  command => '/usr/bin/sudo /usr/sbin/a2enmod php5',
  require => Package['apache2'],
}

file {'/etc/apache2/sites-available/d7gen.local.com.conf':
  source => 'puppet:///modules/files/d7gen.local.com.conf',
  require => Exec['enable-mod-php5'],
}

exec {'enable-site':
  command => '/usr/bin/sudo /usr/sbin/a2ensite d7gen.local.com.conf',
  require => File['/etc/apache2/sites-available/d7gen.local.com.conf'],
}

exec {'reload-apache':
  command => '/usr/bin/sudo /usr/sbin/service apache2 reload',
  require => Exec['enable-site'],
}

import 'php.pp'
