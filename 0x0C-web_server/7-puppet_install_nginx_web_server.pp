#This manifest configures a web server using puppet to run nginx

package {'nginx':
  ensure => installed
}

file {'/var/www/html/index.html':
  ensure => file,
  content => 'Hello World!'
}

