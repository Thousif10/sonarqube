# Start with the Apache HTTP server base image
FROM httpd:latest

# Install Node.js and npm (using NodeSource repository for installation)
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    apt-transport-https && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Set the maintainer label
LABEL maintainer="thousifthousi10@gmail.com"

# Set the working directory in the container
WORKDIR /usr/local/apache2/htdocs/

# Copy package.json and package-lock.json (if available) first
COPY package*.json /usr/local/apache2/htdocs/

# Install npm dependencies (ensure package.json is in place)
RUN npm install

# Now copy the rest of your web application files (HTML, CSS, JS)
COPY . /usr/local/apache2/htdocs/

# Expose port 80 so that the container can be accessed via the web
EXPOSE 80

# Start Apache in the foreground
CMD ["httpd-foreground"]

