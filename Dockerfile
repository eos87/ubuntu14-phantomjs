FROM bradrydzewski/virtualenv
WORKDIR /root
USER root
ADD python.sh /etc/drone.d/

# install python 2.7
RUN sudo apt-get update && sudo apt-get install python2.7 python2.7-dev

# setup default virtualenv for python 2.7
RUN virtualenv --python=/usr/bin/python2.7 /root/virtualenv/python2.7 --system-site-packages && \
        . /root/virtualenv/python2.7/bin/activate && \
        pip install --use-mirrors nose && \
        pip install -U pytest

# Install phantom.js
RUN wget -q https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN tar -xjf phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN cp phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN rm -rf phantomjs-*
