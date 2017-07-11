class ganglia::crons_metrics (

# Lookup function uses Hiera to retrieve a value for a given key
# Arguments => lookup( <NAME>, <VALUE TYPE>, <MERGE BEHAVIOR>, <DEFAULT VALUE> )
# MERGE BEHAVIOR = 'first' is similar to use the hiera() function

    $enable_metric_disk_usage = lookup('ganglia::enable_metric_disk_usage', Boolean, first, false),
    $enable_metric_commit_memory = lookup('ganglia::enable_metric_commit_memory', Boolean, first, false),
    $enable_metric_dcap_workers = lookup('ganglia::enable_metric_dcap_workers', Boolean, first, false),
    $enable_metric_load_per_jobs = lookup('ganglia::enable_metric_load_per_jobs', Boolean, first, false),
){

    if $enable_metric_disk_usage {
        cron::job { 'gmetric_cron':
                minute      => '*',
                hour        => '*',
                date        => '*',
                month       => '*',
                weekday     => '*',
                user        => 'root',
                command     => '/root/gmetric/disk_usage.pl >> /var/log/gmetric.log 2>&1',
                description => 'Check disk usage every minute',
                mode => '0600',
                environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
              }
    }

    if $enable_metric_commit_memory {
        cron::job { 'cron_monitor_commit_memory':
                minute      => '*',
                hour        => '*',
                date        => '*',
                month       => '*',
                weekday     => '*',
                user        => 'root',
                command     => '/root/gmetric/monitor_commit_memory 2>&1 >& /dev/null &',
                mode => '0600',
                environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
              }
    }
    if $enable_metric_dcap_workers {
        cron::job { 'cron_gmetric-dcap_workers':
                minute      => '*',
                hour        => '*',
                date        => '*',
                month       => '*',
                weekday     => '*',
                user        => 'root',
                command     => '/root/gmetric/dcap_workers_gmetric 2>&1 >& /dev/null &',
                mode => '0600',
                environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
              }
    }
    if $enable_metric_load_per_jobs {
        cron::job { 'cron_gmetric-load_per_job':
                minute      => '*',
                hour        => '*',
                date        => '*',
                month       => '*',
                weekday     => '*',
                user        => 'root',
                command     => '/root/gmetric/load_per_job_gmetric 2>&1 >& /dev/null &',
                mode => '0600',
                environment => [ 'PATH="/sbin:/bin:/usr/sbin:/usr/bin:/root/scripts"', ],
              }
    }
}
