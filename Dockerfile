FROM python:3.7.5-slim-buster

LABEL maintainer="InspectorGadget <igadget28@gmail.com>"

# Installing CX Oracle from Source
WORKDIR     /opt/oracle

COPY install-oracle.sh install-oracle.sh
RUN chmod 744 install-oracle.sh 

# Run bootstrapper
RUN /bin/bash -c "./install-oracle.sh"

# Delete the boostrapper script
RUN rm ./install-oracle.sh

# Keeps the Docker container alive (-1)
ENTRYPOINT [ "/bin/bash" ]