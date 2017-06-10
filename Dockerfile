FROM centos:7
MAINTAINER Miroslav Misek <miroslav.misek@netgarden.cz>

ARG dehydrated_version="0.4.0"

RUN yum upgrade && \ 
    yum install -y wget curl openssl && \ 
    mkdir /opt/dehydrated && \
    cd /opt/dehydrated && \
    wget https://github.com/lukas2511/dehydrated/archive/v${dehydrated_version}.tar.gz && \
    tar xvzf v${dehydrated_version}.tar.gz && \
    mv dehydrated-${dehydrated_version} app && \
    rm v${dehydrated_version}.tar.gz
#    git clone https://github.com/lukas2511/dehydrated.git app

COPY config /opt/dehydrated/config
COPY wrapper.sh /opt/dehydrated/
COPY docker-dehydrated.sh /opt/dehydrated/

VOLUME ["/data"]

WORKDIR /opt/dehydrated
ENTRYPOINT ["./wrapper.sh"]
CMD ["-h"]
