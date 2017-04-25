FROM ubuntu:17.04

# Install Nginx ,php, mariadb.
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  apt-get install -y php7.0 php7.0-fpm && \
  apt-get install -y mariadb-server mariadb-client && \
  rm -rf /var/lib/apt/lists/*

# Configure Nginx
RUN \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Ngnix: Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Nginx: Define working directory.
WORKDIR /etc/nginx

# Nginx: Define default command.
CMD ["nginx"]

# Nginx: Expose ports.
EXPOSE 80
EXPOSE 443
