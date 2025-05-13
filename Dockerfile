ARG VERSION=v7.1.1
FROM chocobozzz/peertube:${VERSION}-bookworm


RUN cat /etc/apt/sources.list.d/debian.sources

# install dependencies for vaapi
RUN apt update \
    && apt install -y --no-install-recommends wget apt-transport-https

COPY temp.sources /etc/apt/sources.list.d/debian.sources


RUN apt update \
    && apt install -y --no-install-recommends vainfo intel-media-va-driver \
    && apt install -y --no-install-recommends python3 \
    && rm /var/lib/apt/lists/* -fR
