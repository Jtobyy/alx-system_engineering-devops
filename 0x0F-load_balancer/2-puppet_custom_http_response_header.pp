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

exec {'port':
  command => "/usr/bin/sed -i 's/listen [0-9]* default_server/listen 80 default_server/' /etc/nginx/sites-enabled/default"
}

exec {'ipv6port':
  command => "/usr/bin/sed -i 's/listen [::]:[0-9]* default_server ipv6only=on/listen [::]:80 default_server ipv6only=on/' /etc/nginx/sites-enabled/default"
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

