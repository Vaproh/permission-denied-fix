#!/bin/bash

# Fix ownership
sudo chown -R www-data:www-data /var/www/app

# Fix permissions
sudo chmod -R 755 /var/www/app

# Restart service
sudo systemctl restart nginx
