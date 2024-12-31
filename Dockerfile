ARG VERSION=v7.0.0
FROM chocobozzz/peertube:${VERSION}-bullseye


# install dependencies for vaapi
RUN 	   apt update \
	&& apt install -y --no-install-recommends wget apt-transport-https \
	&& echo "deb http://deb.debian.org/debian/ $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) non-free" | tee /etc/apt/sources.list.d/non-free.list \
	&& apt update \
	&& apt install -y --no-install-recommends vainfo intel-media-va-driver-non-free \
	&& apt install -y --no-install-recommends python3 \
	&& rm /var/lib/apt/lists/* -fR