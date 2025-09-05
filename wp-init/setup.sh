#!/bin/bash

# Disable SSL for MySQL client tools to avoid certificate errors
export MYSQL_SSL_DISABLED=true

# Set working directory
cd /var/www/html

# Download WordPress core if not present
if [ ! -f wp-config-sample.php ]; then
    echo "📦 Downloading WordPress core files..."
    php -d memory_limit=256M /usr/local/bin/wp core download --allow-root
fi

# Wait for WordPress files to be present
echo "⏳ Waiting for WordPress files..."
while [ ! -f wp-config-sample.php ]; do
    sleep 2
done

# Set correct ownership so WP-CLI can write wp-config.php
echo "🔧 Setting file permissions..."
chown -R www-data:www-data /var/www/html

# Create wp-config.php if not present
if [ ! -f wp-config.php ]; then
    echo "🛠️ Creating wp-config.php..."
    php -d memory_limit=256M /usr/local/bin/wp config create \
      --dbname="${WORDPRESS_DB_NAME}" \
      --dbuser="${WORDPRESS_DB_USER}" \
      --dbpass="${WORDPRESS_DB_PASSWORD}" \
      --dbhost="${WORDPRESS_DB_HOST}" \
      --allow-root
fi

# Wait for database connection using direct query
echo "🔌 Waiting for database connection..."
until php -d memory_limit=256M /usr/local/bin/wp db query "SELECT 1;" --allow-root; do
    echo "❌ Database not ready yet..."
    sleep 2
done

# Install WordPress if not already installed
if ! php -d memory_limit=256M /usr/local/bin/wp core is-installed --allow-root; then
    echo "🚀 Installing WordPress..."
    php -d memory_limit=256M /usr/local/bin/wp core install \
        --url="${WORDPRESS_SITE_URL}" \
        --title="My WordPress Site" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --skip-email \
        --allow-root
else
    echo "✅ WordPress already installed."
fi

# Start Apache
echo "🧭 Starting Apache server..."
exec docker-entrypoint.sh apache2-foreground
