FROM debian:bullseye

RUN apt update && apt install -y build-essential cmake libuv1-dev libssl-dev libhwloc-dev

WORKDIR /var/code

ADD . .

RUN mkdir build
WORKDIR /var/code/build
RUN cmake ..
RUN make -j$(nproc)

RUN mv xmrig /bin/xmrig

USER root

ENTRYPOINT ["/bin/xmrig"]