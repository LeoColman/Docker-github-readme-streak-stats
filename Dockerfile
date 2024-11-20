# Use Alpine Linux latest
FROM alpine:latest

# Add build argument and environment variable for port
ARG APPPORT=9000
ENV APPPORT=${APPPORT}

# Install basic dependencies first
RUN apk update && apk add --no-cache \
    curl \
    php82 \
    php82-apache2 \
    php82-curl \
    php82-dom \
    php82-fileinfo \
    php82-intl \
    php82-json \
    php82-mbstring \
    php82-openssl \
    php82-phar \
    php82-tokenizer \
    php82-xml \
    php82-xmlwriter \
    php82-zip \
    git \
    unzip \
    curl-dev \
    inkscape \
    apache2

# Create symbolic links for PHP 8.2
RUN ln -s /usr/bin/php82 /usr/bin/php

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html

# Clone the repository
RUN git clone https://github.com/DenverCoder1/github-readme-streak-stats.git .

# Install PHP dependencies
RUN composer install

RUN composer update

# Copy .env file
COPY .env .env

# Update port in composer.json
RUN sed -i "s/localhost:8000/127.0.0.1:${APPPORT}/" composer.json

# Expose port
EXPOSE ${APPPORT}

# Start PHP development server
CMD ["composer", "start"]
