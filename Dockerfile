FROM ubuntu:20.04

COPY . /tmp
ENV ACT_HOME /opt/async
ENV VLSI_TOOLS_SRC /tmp
ENV PATH $ACT_HOME/bin:$PATH

RUN apt-get update && \
    apt-get install -y build-essential \
                       libedit-dev \
                       zlib1g-dev \
                       m4 && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir $ACT_HOME && \
    cd /tmp && \
    ./configure $ACT_HOME && \
    ./build && \
    make install && \
    rm -Rf /tmp/*



