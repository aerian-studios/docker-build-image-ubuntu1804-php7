FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_VERSION=7.4
ENV TERM=ansi

RUN apt-get update --fix-missing

RUN apt-get install -y \
    curl wget jq git unzip zip maven default-jdk \
    python-software-properties software-properties-common \
    build-essential

RUN LC_ALL=C.UTF-8 apt-add-repository -y ppa:ondrej/php

RUN add-apt-repository ppa:canonical-chromium-builds/stage && \
    apt-get update

RUN apt-get install chromium-browser -y && \
    export CHROME_PATH=$(which chromium-browser)

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install nodejs -y

RUN apt-get install -y php${PHP_VERSION} php${PHP_VERSION}-common \
    php${PHP_VERSION}-mysql php${PHP_VERSION}-pdo php${PHP_VERSION}-xml \
    php${PHP_VERSION}-cli php${PHP_VERSION}-mbstring php${PHP_VERSION}-curl \
    php${PHP_VERSION}-gd composer

RUN export PATH=/usr/bin:/usr/local/bin:$PATH

# Installing AWS CLI
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -b /usr/local/bin/aws
RUN aws --version
RUN rm awscli-bundle.zip

# Add Jenkins user
RUN groupadd jenkins && \
    adduser --disabled-password --gecos "" jenkins && \
    usermod -a -G jenkins jenkins && \
    

# Upgrade bower
RUN npm i -g bower
