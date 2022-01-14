FROM php:8.1.1-fpm

USER root

WORKDIR /var/www

# Install dependencies
RUN apt-get update \
    # gd
    && apt-get install -y --no-install-recommends build-essential  openssl nginx libfreetype6-dev \
    libjpeg-dev libpng-dev libwebp-dev zlib1g-dev libzip-dev gcc g++ make vim unzip curl \
    git jpegoptim optipng pngquant gifsicle locales libonig-dev nodejs npm  \
    libxml2-dev \
    && docker-php-ext-configure gd  \
    && docker-php-ext-install gd \
    # gmp
    && apt-get install -y --no-install-recommends libgmp-dev \
    && docker-php-ext-install gmp \
    # pdo_mysql
    && docker-php-ext-install pdo_mysql mbstring \
    # pdo
    && docker-php-ext-install pdo \
    # opcache
    && docker-php-ext-enable opcache \
    # zip
    && docker-php-ext-install bcmath \
    && docker-php-ext-install xml \
    && docker-php-ext-install zip 

RUN  pecl install grpc  \
    && docker-php-ext-enable grpc 

COPY ./deploy/local.ini /usr/local/etc/php/local.ini

COPY ./deploy/conf.d/nginx.conf /etc/nginx/nginx.conf

COPY ./deploy/post_deploy.sh /var/www/post_deploy.sh

RUN apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear/
