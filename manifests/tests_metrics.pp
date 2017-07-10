class ganglia::tests_metrics {

#If hiera($aaa)=true
    file {'/root/gmetric/disk_usage.pl':
        ensure => present,
        mode => '0700',
        owner => 'root',
        group => 'root',
        source => 'puppet:///grid_files/ganglia/gmetric/disk_usage.pl',
    }

#If hiera($bbb)=true
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

#If hiera($ccc)=true
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


#If hiera($ddd)=true
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
