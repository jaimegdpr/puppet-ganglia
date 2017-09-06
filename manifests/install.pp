class ganglia::install {

    if $osfamily == 'Redhat'{

        case $operatingsystemmajrelease {
            '6': {
                package {['ganglia-gmond', 'ganglia', 'ganglia-devel']:
                    ensure => '3.7.2-2.el6',
                }
            }
            '7': {
                package {['ganglia-gmond', 'ganglia', 'ganglia-devel']:
                    ensure => '3.7.2-2.el7',
                }
            }
        }
    }


# OLD GANGLIA VERSION
#
#      # RPM filename
#      $ganglia_package = 'ganglia-gmond-3.0.6-1.x86_64.rpm'
#
#      file {"/root/packages/${ganglia_package}":
#            ensure => present,
#            source => "puppet:///grid_files/packages/${ganglia_package}",
#        }
#
#        package {'ganglia-gmond':
#            ensure => present,
#            provider => rpm, 
#        } 

}
