# Installs a Nginx server

exec {'install':
  command  => 'sudo apt update ; sudo apt -y install nginx',
  provider => shell,
}

exec {'Hello':
  command  => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
}

exec {'insert redirect_me':
  command => 'sed -i "s/server_name _;/server_name _;\n\tlocation \/redirect_me {\n\t\treturn 301 https:\/\/www.x.com;\n\t}\n/g" /etc/nginx/sites-available/default'
  provider => shell,
}

exec {'run':
  command  => 'sudo service nginx restart',
  provider => shell,
}
