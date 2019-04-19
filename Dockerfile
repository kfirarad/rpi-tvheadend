FROM resin/rpi-raspbian

RUN apt update \
	&& apt install git


RUN git clone https://github.com/tvheadend/tvheadend.git

RUN apt update \
	&& apt install dpkg-dev gcc \
	build-essential:native debhelper pkg-config \
	gettext libavahi-client-dev libssl-dev zlib1g-dev wget \
	liburiparser-dev python python-requests cmake libpcre3-dev libdvbcsa-dev

WORKDIR tvheadend

ENV AUTOBUILD_CONFIGURE_EXTRA --disable-ffmpeg_static

#RUN ./Autobuild.sh
RUN ./configure --disable-ffmpeg_static --disable-dvbscan
RUN make
RUN make install

CMD tvheadend
