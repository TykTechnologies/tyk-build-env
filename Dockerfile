FROM debian:buster-slim
RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates git curl jq build-essential libluajit-5.1-2 luarocks python3-setuptools python3-dev python3-pip
RUN luarocks install lua-cjson

RUN pip3 install grpcio
RUN pip3 install protobuf

# Go install
RUN curl -sL https://dl.google.com/go/go1.12.8.linux-amd64.tar.gz | tar -xzC /usr/local/

RUN mkdir -p /go/src/plugin-build
COPY data/build.sh /build.sh
RUN chmod +x /build.sh

ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=/go

ENTRYPOINT ["/build.sh"]
