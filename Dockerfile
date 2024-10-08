# Use the official Nginx image from the Docker Hub
FROM nginx:latest

# Copy static files to the Nginx html directory
COPY ./html /usr/share/nginx/html

# Expose port 80 to access the server
EXPOSE 80
