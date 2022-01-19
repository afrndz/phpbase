FROM ubuntu:focal as main

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt -y upgrade

# install essential packages
RUN apt-get -y install \
  curl \
  build-essential \
  software-properties-common \
  language-pack-en-base \
  gconf-service \
  libasound2 \
  libgtk-3-0 \
  gconf-service \
  libasound2 \
  libgconf-2-4 \
  libnspr4 \
  libx11-dev \
  fonts-liberation \
  xdg-utils \
  libnss3 \
  libxss1 \
  libappindicator3-1 \
  libindicator3-7 \
  libgbm1 \
  git \
  zip \
  unzip \
  xvfb \
  wget \ 
  gcc \ 
  g++ \
  make \ 
  autoconf  \
  zlib1g-dev 

RUN add-apt-repository -y ppa:ondrej/php && \
  apt-get update

FROM main as phpbuild
RUN apt-get -y install \
  exiftool \
  protobuf-compiler protobuf-compiler-grpc \
  php8.0 \
  php8.0-common \
  php8.0-dev \ 
  php8.0-fpm \
  php8.0-mbstring \
  php8.0-dom \
  php8.0-curl \
  php8.0-simplexml \
  php8.0-gd \
  php8.0-zip \
  php8.0-sqlite3 \
  php8.0-bcmath \
  php8.0-intl \
  php8.0-mysql \
  php-xml \
  php8.0-xml 


FROM phpbuild as app

COPY ./conf/nginx/default /etc/nginx/sites-enabled/default
COPY ./conf/post_deploy.sh /var/www/post_deploy.sh

# install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin --filename=composer
# GRPC


RUN pecl install grpc

#Enable modules
RUN cd /etc/php/8.0/mods-available \ 
 && echo "extension=grpc.so" > grpc.ini \
 && phpenmod grpc

# NGINX
RUN apt-get install nginx -y

RUN ["chmod", "+x", "/var/www/post_deploy.sh"]