# Start with the official Apache HTTP server image
FROM httpd:latest

# Set the maintainer label (optional)
LABEL maintainer="thousifthousi10@gmail.com"

# Set the working directory to Apache's document root
WORKDIR /usr/local/apache2/htdocs/

# Copy your website files (HTML, CSS, JS) into the container
COPY . /usr/local/apache2/htdocs/

# Expose port 80 so that the container can be accessed via the web
EXPOSE 80

# Start Apache in the foreground
CMD ["httpd-foreground"]

