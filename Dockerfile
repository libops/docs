FROM python:3.13-alpine@sha256:323a717dc4a010fee21e3f1aac738ee10bb485de4e7593ce242b36ee48d6b352

RUN mkdir -p /docs

WORKDIR /docs

COPY requirements.txt .
RUN apk add --no-cache cairo \
  && pip install -r requirements.txt 

COPY . .
RUN mkdocs build

# serve the docs via nginx
FROM nginx:1.27@sha256:9d6b58feebd2dbd3c56ab5853333d627cc6e281011cfd6050fa4bcf2072c9496
COPY --from=0 /docs/site /usr/share/nginx/html
RUN echo 'real_ip_header X-Forwarded-For;' > /etc/nginx/conf.d/real-ip.conf \
  && echo 'set_real_ip_from 169.254.1.1/32;' >> /etc/nginx/conf.d/real-ip.conf
