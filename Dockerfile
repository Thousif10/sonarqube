# Use a Node.js base image that includes npm
FROM node:16

# Install Apache HTTP server
RUN apt-get update && apt-get install -y apache2

# Set the maintainer label
LABEL maintainer="thousifthousi10@gmail.com"

# Set the working directory in the container
WORKDIR /usr/local/apache2/htdocs/

# Copy your web application files (e.g., HTML, CSS, JS) into the Apache server directory
COPY . /usr/local/apache2/htdocs/

# Install npm dependencies (if you have a package.json)
RUN npm install

# Expose port 80 so that the container can be accessed via the web
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

