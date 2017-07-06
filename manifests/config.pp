class ganglia::config {
      
      #TODO: Modify to get value from Hiera
      $ganglia_lcg_cluster = 'workers'

      file {"/etc/gmond.conf":
            ensure => present,
            source => "puppet:///grid_files/ganglia/gmond_lcg_${ganglia_lcg_cluster}.conf",
            owner => 'root',
            group => 'root',
            mode => '0600',
            require => Package['ganglia-gmond'],
            notify => Service['gmond'],
        }

}
