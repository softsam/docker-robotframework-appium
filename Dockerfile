FROM debian:latest

RUN apt-get update && \
    apt-get -y install python-pip git && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install robotframework==2.9

# install appium library from github
RUN mkdir /appiumlibrary
RUN pip install setuptools==18.1
RUN git clone https://github.com/jollychang/robotframework-appiumlibrary.git /appiumlibrary
WORKDIR /appiumlibrary
RUN python setup.py install
RUN rm -rf /appiumlibrary

# Volume containing robotframework tests
RUN mkdir /robot
VOLUME /robot
WORKDIR /robot

# Clean up
RUN echo y | apt-get remove --purge git

ENTRYPOINT ["/usr/local/bin/pybot"]
