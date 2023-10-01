FROM nginx:1.22.1

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html

ADD index.html .

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]