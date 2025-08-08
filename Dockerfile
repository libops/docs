FROM python:3.13-alpine@sha256:f196fd275fdad7287ccb4b0a85c2e402bb8c794d205cf6158909041c1ee9f38d

RUN mkdir -p /docs

WORKDIR /docs

COPY requirements.txt .
RUN apk add --no-cache cairo \
  && pip install -r requirements.txt 

COPY . .
RUN mkdocs build

# serve the docs via nginx
FROM nginx:1.29@sha256:84ec966e61a8c7846f509da7eb081c55c1d56817448728924a87ab32f12a72fb
COPY --from=0 /docs/site /usr/share/nginx/html
RUN echo 'real_ip_header X-Forwarded-For;' > /etc/nginx/conf.d/real-ip.conf \
  && echo 'set_real_ip_from 169.254.1.1/32;' >> /etc/nginx/conf.d/real-ip.conf
