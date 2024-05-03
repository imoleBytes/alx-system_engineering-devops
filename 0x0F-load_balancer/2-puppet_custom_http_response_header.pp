# Installs a Nginx server

exec {'install':
  command  => 'sudo apt update ; sudo apt -y install nginx',
  provider => shell,
}

exec {'Hello':
  command  => 'sudo echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
}



exec {'add_header':
  command => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOSTNAME\";\n/" /etc/nginx/nginx.conf',
  provider => shell,
}

exec {'run':
  command  => 'sudo service nginx restart',
  provider => shell,
}
