ARG PHP_VERSION

FROM dunglas/frankenphp:php${PHP_VERSION}

# Set server name to ":80" to serve via plain HTTP (as HTTPS should be implemented on LB or Reverse proxy)
ENV SERVER_NAME=":80"

# Install system level dependencies to reduce build time of app image
RUN apt-get update && apt-get install -y git zip unzip && rm -rf /var/lib/apt/lists/*
RUN install-php-extensions zip intl amqp apcu gd pgsql pdo_pgsql
