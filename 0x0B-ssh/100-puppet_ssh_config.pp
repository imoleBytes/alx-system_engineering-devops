# puppet manifest/script to create ssh config file

file_line { 'Turn off the password authentification':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentication no',
  line   => '    IdentityFile ~/.ssh/school',
}
