class ganglia::tests_metrics (
    $enable_metric_disk_usage = lookup('ganglia::enable_metric_disk_usage', Boolean, first, false),
    $enable_metric_commit_memory = lookup('ganglia::enable_metric_commit_memory', Boolean, first, false),
    $enable_metric_dcap_workers = lookup('ganglia::enable_metric_dcap_workers', Boolean, first, false),
    $enable_metric_load_per_jobs = lookup('ganglia::enable_metric_load_per_jobs', Boolean, first, false),
    ) {

    require ciemat_tweaks::folders

    if $enable_metric_disk_usage {
        file {'/root/gmetric/disk_usage.pl':
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/disk_usage.pl',
        }
    }

    if $enable_metric_commit_memory {
        file {'/root/gmetric/monitor_commit_memory':
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/monitor_commit_memory',
        }


        file {'/root/gmetric/monitor_commit_memory_text':
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/monitor_commit_memory_text',
        }
    }

    if $enable_metric_dcap_workers {
        file {'/root/gmetric/dcap_workers_gmetric':
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/dcap_workers_gmetric',
        }

        file {'/root/gmetric/dcap_workers_gmetric_text':
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/dcap_workers_gmetric_text',
        }

        file {'/root/gmetric/pref_lhcone.txt':
            ensure => present,
            mode => '0644',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/pref_lhcone.txt',
        }

    }

    if $enable_metric_load_per_jobs {
        file {'/root/gmetric/load_per_job_gmetric':
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/load_per_job_gmetric',
        }

        file {'/root/gmetric/load_per_job_gmetric_text':
            ensure => present,
            mode => '0700',
            owner => 'root',
            group => 'root',
            source => 'puppet:///grid_files/ganglia/gmetric/load_per_job_gmetric_text',
        }
    }
}

