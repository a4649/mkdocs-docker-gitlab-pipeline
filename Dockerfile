FROM docker.io/library/nginx:stable-alpine3.17

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

ARG WITH_PLUGINS=true
ENV PACKAGES=/usr/local/lib/python3.11/site-packages
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

COPY requirements.txt /app/requirements.txt
COPY docs /app/docs
COPY mkdocs.yml /app/mkdocs.yml
COPY default.conf /etc/nginx/conf.d/default.conf 

RUN \
  apk upgrade --update-cache -a \
&& \
  apk add --no-cache \
    cairo \
    freetype-dev \
    jpeg-dev \
    openssh \
    zlib-dev \
&& \
  apk add --no-cache \
    gcc \
    libffi-dev \
    musl-dev \
&& \
  python -m pip install --no-cache-dir --upgrade pip \
&& \
  python -m pip install --no-cache-dir -r requirements.txt

RUN mkdocs build

RUN cp -r site /usr/local/share/nginx/

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]