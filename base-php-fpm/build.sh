#!/bin/bash
<<<<<<< HEAD
docker build -t alexfrndz/phpbase:8-fpm .
=======
docker buildx build --platform=linux/amd64 -t alexfrndz/phpbase:8-fpm-v1 .
>>>>>>> f0c3caf (fix: add Access Control)
