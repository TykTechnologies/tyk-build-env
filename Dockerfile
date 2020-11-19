FROM golang:1.12.17
ENV PATH=$PATH
ENV GOPATH=/go

RUN apt-get update && apt-get dist-upgrade -y ca-certificates \
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
RUN mkdir -p $GOPATH && go get github.com/mitchellh/gox
RUN gem install fpm

ENV PACKER_VERSION=1.6.5
RUN curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o /tmp/packer.zip && unzip /tmp/packer.zip -d /usr/local/bin
