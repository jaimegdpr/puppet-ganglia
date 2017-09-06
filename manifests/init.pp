class ganglia {

    include ganglia::install
    include ganglia::config
    include ganglia::service
    include ganglia::tests_metrics
    include ganglia::crons_metrics

    Class['ganglia::install'] ->
    Class['ganglia::config'] ->
    Class['ganglia::service']

}

