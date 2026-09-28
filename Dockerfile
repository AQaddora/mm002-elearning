FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
# Dokku probes $PORT (5000), not 80 — make nginx agree with it.
RUN sed -i 's/listen\s*80;/listen 5000;/' /etc/nginx/conf.d/default.conf
EXPOSE 5000
CMD ["nginx","-g","daemon off;"]
