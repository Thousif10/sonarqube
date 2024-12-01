# Use an official Apache2 image as a base
FROM httpd:latest

# Set the maintainer label
LABEL maintainer="thousifthousi10@gmail.com"

# Set the working directory in the container
WORKDIR /usr/local/apache2/htdocs/

# Copy the web application files (e.g., HTML, CSS, JS) into the Apache server directory
COPY . /usr/local/apache2/htdocs/

# Expose port 80 so that the container can be accessed via the web
EXPOSE 80

# Optionally, copy your custom Apache2 configuration file
# COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf

# Start Apache in the foreground (this is the default entrypoint for the base image)
CMD ["httpd-foreground"]
