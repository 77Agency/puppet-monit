define monit::custom_service($name,$process, $pidfile, $start_command, $end_command, $rules = ["if 5 restarts within 5 cycles then timeout"] ) {
  file { "/etc/monit/conf.d/${name}":
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("monit/common/etc/monit/conf.d/sample.erb")
    notify  => Service['monit'],
    require => [
      File['conf.d'],
      Package['monit']
    ],
  }
}
