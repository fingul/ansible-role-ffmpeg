FROM ubuntu:trusty

RUN cd /etc/apt && \
    sed -i 's/archive.ubuntu.com/ftp.neowiz.com/g' sources.list

# sffmpeg

RUN apt-get update \
    && apt-get install -y \
    git build-essential unzip \
    cmake automake libtool  pkg-config curl mercurial

RUN git clone https://github.com/pyke369/sffmpeg.git

WORKDIR /sffmpeg

VOLUME /ffmpeg-bin

CMD git pull && MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)" make && cp /sffmpeg/build/bin/{frmxtract,ffmpeg,ffprobe} /ffmpeg-bin

#
#RUN mkdir -p /sffmpeg
#
#RUN git clone https://github.com/pyke369/sffmpeg.git /sffmpeg
#
#WORKDIR /sffmpeg
#
#VOLUME /ffmpeg-bin
#
#CMD git pull && MAKEFLAGS="-j $(grep -c ^processor /proc/cpuinfo)" make && cp /sffmpeg/build/bin/{frmxtract,ffmpeg,ffprobe} /ffmpeg-bin

#&& cp /sffmpeg/build/bin/ffmpeg /sffmpeg/build/bin/ffprobe /ffmpeg-bin

#tar cvfz ffmpeg-2.8.1-bin.tgz -C ffmpeg-2.8.1-bin .


#RUN git pull && make #&& cp /sffmpeg/build/bin/ffmpeg /sffmpeg/build/bin/ffprobe /ffmpeg-bin
#
#RUN cp /sffmpeg/build/bin/ffmpeg /usr/local/bin/ffmpeg
#RUN cp /sffmpeg/build/bin/ffprobe /usr/local/bin/ffprobe
#RUN rm -rf /sffmpeg