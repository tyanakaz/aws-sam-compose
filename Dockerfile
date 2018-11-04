FROM ubuntu:18.10

# docker build process is treated as locale with in the POSIX.
# It must be defined explicitly in Dockerfile
# https://github.com/docker/docker/issues/2424#issuecomment-27269233
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# apt-get upgrade
RUN set -x \
        && apt-get update -q \
        && apt-get install -qy --no-install-recommends \
           locales git ssh vim less curl python \
           python-dev build-essential libssl-dev libffi-dev \
           libxml2-dev libxslt1-dev zlib1g-dev \
        # Update Locale to en_US.UTF-8 \
        && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
        && locale-gen && update-locale LANG=en_US.UTF-8

# node setup
ENV NPM_CONFIG_LOGLEVEL info

# Install react and react-dom
#ENV AWS_CLI
#ENV AWS_SAM_CLI

RUN set -x \
            && curl -kL https://bootstrap.pypa.io/get-pip.py | python

RUN set -x \
            && pip install awscli \
            && pip install aws-sam-cli

WORKDIR /usr/src/app

