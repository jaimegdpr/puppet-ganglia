class ganglia::config (
    # Check variables from Hiera to assign a cloud and a cluster
    # Cloud 'lcg' | Valid clusters -> aux, servers, dcache, workers
    # Cloud 'bulk' | Valid clusters -> desktop, server
    # Another values are not allowed. 'Enum' data type check it.

    $ganglia_cloud = lookup('ganglia::cloud', Enum['lcg', 'bulk'], first, undef),
    $ganglia_cluster = lookup('ganglia::cluster', Enum['aux', 'servers', 'dcache',
                                                      'workers', 'desktop', 'server'] , first, undef),
){

      file {"/etc/gmond.conf":
            ensure => present,
            source => "puppet:///grid_files/ganglia/gmond_${ganglia_cloud}_${ganglia_cluster}.conf",
            owner => 'root',
            group => 'root',
            mode => '0600',
            require => Package['ganglia-gmond'],
            notify => Service['gmond'],
        }

}
