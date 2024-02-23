# Using Puppet, create a file in /tmp.

$filepath = '/tmp/school'

exec {'create /tmp/school':
    command => "echo 'I love Puppet' > $filepath"
}

exec {'change owner and group':
    command => "chown www-data:www-data $filepath"
    require => Exec['create /tmp/school']
}

exec {'permision':
    command => "chmod 0744 $filepath"
    require => Exec['create /tmp/school']
}
