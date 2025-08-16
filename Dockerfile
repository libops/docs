FROM python:3.13-alpine@sha256:a70b35b575e33d951e3f9d3fe94163ef0fd338c22552bc587a1b098a87ed6184

RUN mkdir -p /docs

WORKDIR /docs

COPY requirements.txt .
RUN apk add --no-cache cairo \
  && pip install -r requirements.txt 

COPY . .
RUN mkdocs build

# serve the docs via nginx
FROM nginx:1.29@sha256:33e0bbc7ca9ecf108140af6288c7c9d1ecc77548cbfd3952fd8466a75edefe57
COPY --from=0 /docs/site /usr/share/nginx/html
RUN echo 'real_ip_header X-Forwarded-For;' > /etc/nginx/conf.d/real-ip.conf \
  && echo 'set_real_ip_from 169.254.1.1/32;' >> /etc/nginx/conf.d/real-ip.conf
