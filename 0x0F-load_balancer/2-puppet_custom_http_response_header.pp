# This manifest automates the task of
# setting up a brand new ubuntu machine with nginx and
# creating a custom HTTP header response, but with Puppet.

package {'nginx':
  ensure => installed
}

file {'/var/www/html/index.html':
  ensure => file,
  content => 'Hello World!'
}

exec {'newline':
  command => '/usr/bin/sed -i "16  i add_header X-Served-By \$hostname;" /etc/nginx/nginx.conf'
}

exec {'nginx':
  command => '/usr/bin/sudo service nginx restart'
  }

#  file_line {'Httpsection':
#  ensure => present,
#  path => '/etc/nginx/nginx.conf',
#  line => 'add_header X-Served-By \$hostname;',
#  after => 'http {'
#}

