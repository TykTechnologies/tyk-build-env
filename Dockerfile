FROM golang:1.15
ENV GOPATH=/go
ENV PATH=${PATH}:${GOPATH}/bin

RUN apt-get update && apt-get dist-upgrade -y && \
        apt-get install -y ca-certificates git locales curl jq rpm build-essential unzip \
        libluajit-5.1-2 libluajit-5.1-dev luarocks \
        python3-setuptools python3-dev python3-pip \
        ruby-dev \
        nodejs
# In the github action, we need the docker cli inside the container for AWS actions
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
        echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" > /etc/apt/sources.list.d/docker.list && \
        apt-get update && apt-get install docker-ce-cli
# RUN curl -fsSL https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -o terraform.zip && \
#         unzip terraform.zip -d /usr/bin && rm terraform.zip
RUN luarocks install lua-cjson
RUN pip3 install grpcio protobuf
RUN gem install fpm
RUN go get github.com/mitchellh/gox
RUN mkdir -p $GOPATH
