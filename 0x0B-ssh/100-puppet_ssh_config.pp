# This manifest makes changes to a configuration file.

file {'/etc/ssh/ssh_config':
  ensure => file,
  content => "IdentityFile ~/.ssh/school\nPasswordAuthentication no"
}
