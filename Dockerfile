FROM debian:latest

RUN apt-get update && \
    apt-get -y install python-pip && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install robotframework==2.9rc1
RUN pip install robotframework-appiumlibrary==1.2.7

ENTRYPOINT ["/usr/local/bin/pybot"]
