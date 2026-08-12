# ---- Base image ----
# nginx:alpine chosen for minimal footprint (~40MB) vs nginx:latest (~190MB)
# and reduced attack surface for serving static content only.
FROM nginx:alpine

# ---- Remove default nginx content ----
RUN rm -rf /usr/share/nginx/html/*

# ---- Copy static site files ----
# No build/compile step exists for this project (plain HTML/CSS/JS), so a
# multi-stage build was evaluated but is not required here.
COPY . /usr/share/nginx/html

# ---- Reconfigure nginx to listen on an unprivileged port ----
# Binding to port 80 requires root. Since the container will run as a
# non-root user below, nginx is reconfigured to listen on 8080 instead.
RUN sed -i 's/listen\s*80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# ---- Security: run as non-root ----
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

USER nginx

# ---- Expose the port nginx now listens on ----
EXPOSE 8080

# ---- Healthcheck ----
HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=5 \
  CMD wget -q --spider http://127.0.0.1:8080/ || exit 1
