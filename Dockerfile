FROM golang:1.12.17
ENV PATH=$PATH
ENV GOPATH=/go

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates \
                       git \
                       locales \
                       curl \
                       jq \
                       rpm \
                       dpkg-sig \
                       build-essential \
                       libluajit-5.1-2  libluajit-5.1-dev luarocks \
                       python3-setuptools python3-dev python3-pip \
                       ruby-dev 
RUN luarocks install lua-cjson

RUN pip3 install grpcio
RUN pip3 install protobuf
