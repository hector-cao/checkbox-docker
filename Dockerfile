ARG UBUNTU_RELEASE=jammy
FROM ubuntu:$UBUNTU_RELEASE

ARG CHECKBOX_VERSION=2.6

ENV TZ UTC

RUN useradd -ms /bin/bash ubuntu

RUN set -eux; \
    apt-get update; \
   DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      sudo \
      python3 \
      python3-pip \
      python3-setuptools \
      jq \
      python3-jinja2 \
      python3-markupsafe \
      python3-padme \
      python3-pip \
      python3-psutil \
      python3-requests-oauthlib \
      python3-tqdm \
      python3-urwid \
      python3-xlsxwriter \
      wget \
      tzdata \
    ; \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge --auto-remove -y; \
  rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

COPY deploy-checkbox.sh /tmp/deploy-checkbox.sh
COPY start-checkbox.sh /tmp/start-checkbox.sh

RUN wget https://github.com/canonical/checkbox/archive/refs/tags/v$CHECKBOX_VERSION.tar.gz; \
    tar xvf v$CHECKBOX_VERSION.tar.gz; \
    cd checkbox-$CHECKBOX_VERSION; \
    /tmp/deploy-checkbox.sh; \
    cd /tmp; \
    rm -rf v$CHECKBOX_VERSION.tar.gz;

WORKDIR /tmp/checkbox-$CHECKBOX_VERSION

EXPOSE 18871
ENTRYPOINT [ "/tmp/start-checkbox.sh" ]
