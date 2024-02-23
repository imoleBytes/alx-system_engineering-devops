# Using Puppet, create a file in /tmp.

$filepath = '/tmp/school'

file { $filepath:
    content => 'Ilove Puppet'
    mode    => '0744'
    owner   => 'www-data'
    group   => 'www-data'
}
