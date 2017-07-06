class ganglia::install {

      $ganglia_package = 'ganglia-gmond-3.0.6-1.x86_64.rpm'

      file {"/root/packages/${ganglia_package}":
            ensure => present,
            source => "puppet:///grid_files/packages/${ganglia_package}",
            before => Package['ganglia-gmond'],
        }

        package {'ganglia-gmond':
            ensure => present,
            provider => rpm, 
            source => "/root/packages/${ganglia_package}",
        } 

}
