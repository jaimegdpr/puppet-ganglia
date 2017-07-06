class ganglia::service {
    
    service { 'gmond':
        ensure => running,
        enable => true,
        hasrestart => true,
        require => Package['ganglia-gmond'],
    }
}
