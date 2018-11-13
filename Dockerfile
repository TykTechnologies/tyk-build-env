FROM debian:jessie

RUN apt-get update -y -qq && apt-get install -y ca-certificates curl wget build-essential libluajit-5.1-2 libluajit-5.1-dev luarocks python3-setuptools python3-dev libpython3.4 locales ruby-dev gcc make rubygems rpm gnupg expect perl git openssh-client procps autoconf autogen libtool

RUN wget -O go.tgz "https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz" && tar -C /usr/local -xzf go.tgz && rm go.tgz
RUN mkdir -p "/go/src" "/go/bin" && chmod -R 777 "/go"

RUN luarocks install lua-cjson

# Install fresh pip to support binary distributions
RUN wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py
RUN pip3 install grpcio

RUN GOPATH=/ /usr/local/go/bin/go get github.com/mitchellh/gox
RUN gem install fpm && gem install rake && gem install package_cloud
RUN mkdir -p ~/rpmbuild/SOURCES ~/rpmbuild/SPECS
