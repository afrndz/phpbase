#!/bin/sh

# update application cache
php artisan optimize
php artisan key:generate 
# Run custom scripts
if [ "$RUN_MIGRATION" = "1" ] ; then
 echo "Run Migration..."
 php artisan migrate --force
 echo "Migration done.."
fi
# start the application
/etc/init.d/php8.0-fpm start && nginx -g "daemon off;"





