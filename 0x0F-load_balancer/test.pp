# Manifest tests
file {'newfile':
  path => '/newppfile',
  content => 'Testin',
  ensure => present, 
}

exec {'newline':
  command => '/usr/bin/sed -i "16  i add_header X-Served-By \$hostname;" /etc/nginx/nginx.conf'
}

exec {'nginx':
  command => '/usr/bin/sudo service nginx restart'
  }
  
#file_line {'line2':
 # ensure => present,
 # path => '/newppfile',
 # after => 'This test worked',
 # line => 'And this also worked'
