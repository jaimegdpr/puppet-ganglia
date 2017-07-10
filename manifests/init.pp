class ganglia {

    class {'ganglia::install':}
    class {'ganglia::config':}
    class {'ganglia::service':}
    class {'ganglia::tests_metrics':}
    class {'ganglia::crons_metrics':}

}

