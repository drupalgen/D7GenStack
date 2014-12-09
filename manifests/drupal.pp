exec { 'get-composer':
  command => '/usr/bin/curl -sS https://getcomposer.org/installer | /usr/bin/php',
  cwd => '/usr/local',
  user => 'root',
}

exec {'move-composer-to-executable':
  command => '/usr/bin/sudo /bin/mv /usr/local/composer.phar /usr/local/bin/composer',
  cwd => '/usr/local',
  user => 'root',
  require => Exec['get-composer'],
}

exec {'update-composer':
  command => '/usr/bin/sudo /usr/local/bin/composer self-update',
  cwd => '/usr/local',
  user => 'root',
  require => Exec['move-composer-to-executable'],
}

exec {'clone-drush-repo':
  command => '/usr/bin/sudo /usr/bin/git clone https://github.com/drush-ops/drush.git /usr/local/drush-master',
  cwd => '/usr/local',
  user => 'root',
  require => Exec['update-composer'],
}

exec {'create-drush-symlink':
  command => '/usr/bin/sudo /bin/ln -s /usr/local/drush-master/drush /usr/local/bin/drush',
  cwd => '/usr/local',
  user => 'root',
  require => Exec['clone-drush-repo'],
}

exec {'update-drush':
  command => '/usr/bin/sudo /usr/local/bin/composer update',
  cwd => '/usr/local/drush-master',
  user => 'root',
  require => Exec['create-drush-symlink'],
}

exec {'stop-apache':
  command => '/usr/bin/sudo /usr/sbin/service apache2 stop',
  user => 'root',
  require => Exec['update-drush'],
}

exec {'change-apache-user-to-vagrant':
  command => "/bin/sed -i 's/^export APACHE_RUN_USER=www-data/export APACHE_RUN_USER=vagrant/' /etc/apache2/envvars",
  user => 'root',
  require => Exec['stop-apache'],
}

exec {'change-apache-group-to-vagrant':
  command => "/bin/sed -i 's/^export APACHE_RUN_GROUP=www-data/export APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars",
  user => 'root',
  require => Exec['stop-apache'],
}

exec {'change-apache-lockfile-to-vagrant':
  command => '/usr/bin/sudo /bin/chown -Rf vagrant:root /var/lock/apache2',
  user => 'root',
  require => [
    Exec['change-apache-user-to-vagrant'],
    Exec['change-apache-group-to-vagrant'],
  ],
}

exec {'make-drupal-root':
  command => '/bin/mkdir -p /vagrant/drupal',
  require => Exec['stop-apache'],
}

exec {'download-drupal':
  command => '/usr/local/bin/drush dl --drupal-project-rename=public_html',
  cwd => '/vagrant/drupal',
  require => Exec['make-drupal-root'],
}

exec {'install-drupal':
  command => '/usr/local/bin/drush site-install --site-name="D7Gen Dev Site" --account-name=admin --account-pass=admin --db-url=mysql://drupaluser:1drupaluser@localhost/drupal -y',
  cwd => '/vagrant/drupal/public_html',
  require => Exec['download-drupal'],
}

exec {'restart-apache':
  command => '/usr/bin/sudo /usr/sbin/service apache2 restart',
  user => 'root',
  require => Exec['change-apache-lockfile-to-vagrant'],
}

exec {'create-module-folders':
  command => '/bin/mkdir -p /vagrant/drupal/public_html/sites/all/modules/contrib',
  require => Exec['restart-apache'],
}


