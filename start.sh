#!/bin/bash

echo "Starting Laravel application..."

echo "Clearing cache..."
php artisan config:clear
php artisan route:clear
php artisan cache:clear

echo "Creating storage link..."
php artisan storage:link || true

echo "Running migrations..."
php artisan migrate --force

echo "Running seeders..."
php artisan db:seed --force

echo "Caching config..."
php artisan config:cache
php artisan route:cache

echo "Starting server..."
php artisan serve --host=0.0.0.0 --port=$PORT
