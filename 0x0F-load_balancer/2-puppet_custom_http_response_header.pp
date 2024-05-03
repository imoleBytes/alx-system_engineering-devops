# Installs a Nginx server

exec {'install nginx':
  command  => 'sudo apt update ; sudo apt -y install nginx',
  provider => shell,
}

exec {'Hello':
  command  => 'sudo echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
}

exec {'404':
  command  => 'sudo echo "Ceci n'est pas une page" | sudo tee /var/www/html/404.html',
  provider => shell,
}

exec {'sudo sed -i "s/listen 80 default_server;/listen 80 default_server;\n\tlocation \/redirect_me {\n\t\treturn 301 https:\/\/x.com\/;\n\t}/g" /etc/nginx/sites-available/default':
  provider => shell,
}

exec {'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$HOSTNAME\";\n/" /etc/nginx/nginx.conf':
  provider => shell,
}

exec {'run':
  command  => 'sudo service nginx restart',
  provider => shell,
}