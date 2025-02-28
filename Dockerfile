# Utiliser l'image officielle PHP avec Apache
FROM php:8.2-apache

# Installer les extensions PHP nécessaires
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Activer mod_rewrite pour Apache
RUN a2enmod rewrite

# Copier le code source de l'application dans le conteneur
COPY . /var/www/html/

# Donner les bons droits aux fichiers
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80

# Lancer Apache en arrière-plan
CMD ["apache2-foreground"]
