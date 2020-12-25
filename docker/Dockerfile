FROM ubuntu:focal
WORKDIR /code

# use wget as a headlessbrowser
ENV BROWSER="/usr/bin/wget --no-check-certificate"

# install apt requirements
# hadolint ignore=DL3008
RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        sudo \
        xdg-utils \
        wget \
    && rm -rf /var/lib/apt/lists/*

COPY . ./

# install
RUN bash install.sh
