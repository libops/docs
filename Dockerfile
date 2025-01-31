FROM python:3.13-alpine@sha256:f9d772b2b40910ee8de2ac2b15ff740b5f26b37fc811f6ada28fce71a2542b0e

RUN mkdir -p /docs

WORKDIR /docs

COPY requirements.txt .
RUN apk add --no-cache cairo \
  && pip install -r requirements.txt 

COPY . .
RUN mkdocs build

# serve the docs via nginx
FROM nginx:1.27@sha256:0a399eb16751829e1af26fea27b20c3ec28d7ab1fb72182879dcae1cca21206a
COPY --from=0 /docs/site /usr/share/nginx/html
RUN echo 'real_ip_header X-Forwarded-For;' > /etc/nginx/conf.d/real-ip.conf \
  && echo 'set_real_ip_from 169.254.1.1/32;' >> /etc/nginx/conf.d/real-ip.conf
