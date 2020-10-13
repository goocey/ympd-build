FROM ubuntu

RUN apt update && apt install -y tzdata
ENV TZ=Asia/Tokyo
RUN apt update && apt upgrade -y

RUN apt install -y cmake libmpdclient-dev git libssl-dev git
RUN pwd
RUN git clone https://github.com/notandy/ympd.git
WORKDIR ympd
RUN mkdir build
WORKDIR build
RUN cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr && \
    make && \
    make install
