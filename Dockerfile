FROM ubuntu:20.04

COPY . /tmp/build_dir
ENV ACT_HOME /opt/async
ENV VLSI_TOOLS_SRC /tmp/build_dir
ENV PATH $ACT_HOME/bin:$PATH

RUN apt-get update && \
    apt-get install -y build-essential \
                       libedit-dev \
                       zlib1g-dev \
                       m4 && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir $ACT_HOME && \
    cd $VLSI_TOOLS_SRC && \
    ./configure $ACT_HOME && \
    ./build && \
    make install && \
    apt-get purge --auto-remove -y build-essential && \
    rm -Rf $VLSI_TOOLS_SRC



