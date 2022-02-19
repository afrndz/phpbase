FROM alexfrndz/phpbase:8-fpm as baseimage

USER root

WORKDIR /var/www

COPY ./deploy/conf.d/nginx.conf /etc/nginx/nginx.conf

RUN ["chmod", "+x", "post_deploy.sh"]
