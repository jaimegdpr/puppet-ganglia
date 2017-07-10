class ganglia::crons_metrics {

#If hiera($aaa)=true

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
#If hiera($bbb)=true
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

#If hiera($ccc)=true
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

#If hiera($ddd)=true
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
