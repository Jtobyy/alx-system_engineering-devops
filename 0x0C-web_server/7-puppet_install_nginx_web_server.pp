#This manifest configures a web server using puppet to run nginx

package {'nginx':
  ensure => installed
}

exec {'index':
  command => "echo -e 'Hello World!\n' > \
$(grep -m 1 'root /' /etc/nginx/sites-enabled/default | \
tr -d ';' | cut -f 1 -d ' ' --complement)/index.html"
}

exec {'port':
  command => sudo sed -i 's/listen [0-9]* default_server/listen 80 default_server/' /etc/nginx/sites-enabled/default
}

exec {'portipv6':
  command => sudo sed -i 's/listen \[::\]:[0-9]* \
default_server ipv6only=on/listen \[::\]:80 default_server \
ipv6only=on/' /etc/nginx/sites-enabled/default
}

exec {'redirect':
  command => sudo sed -i '$(grep -n server_name /etc/nginx/sites-enabled/default | cut -d : -f 1 | head -n 1) i rewrite ^/redirect_me http://jtobyy.tech permanent;' /etc/nginx/sites-enabled/default
}

exec {'restart':
  command => sudo service nginx restart
}
