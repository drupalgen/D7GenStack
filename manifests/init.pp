Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
}

package {'ntp':
  ensure => installed,
}

package {'tar':
  ensure => installed,
}

host {'d7gen.local.com':
  ip => '192.168.200.100',
}
