FROM python:3.7.5-slim-buster

LABEL maintainer="InspectorGadget <igadget28@gmail.com>"

# Installing CX Oracle from Source
WORKDIR     /opt/oracle

COPY ./bootstrap/install-oracle.sh install-oracle.sh
RUN chmod 744 install-oracle.sh 

ENTRYPOINT [ "/bin/bash", "./install-oracle.sh"]