# Use the official Nginx image as base
FROM nginx:latest

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static files for /about and /write-to-us pages
COPY static /usr/share/nginx/html

