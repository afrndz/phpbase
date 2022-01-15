#!/bin/sh

# update application cache
php artisan optimize

# Run custom scripts
if [ "$RUN_MIGRATION" = "1" ] ; then
 echo "Run Migration..."
 php artisan migrate --force
 echo "Migration done.."
fi
# start the application

php-fpm -D &&  nginx -g "daemon off;"


