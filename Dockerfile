FROM selenium/standalone-chrome:3.9.1-actinium

USER root

COPY  ./extensions /data
RUN /data/extract.sh

USER seluser
