#!/bin/sh

# Ensure .env exists
touch .env

# Force write TOKEN into .env
echo "TOKEN=${TOKEN}" > /var/www/html/.env

# Execute the original command
exec "$@"
