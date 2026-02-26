# Use official nginx image
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

# Copy project files to nginx folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80