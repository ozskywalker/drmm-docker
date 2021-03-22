FROM ubuntu:focal

RUN apt-get -y update \
    && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install wget mono-devel

COPY run_cag.sh /opt/run_cag.sh

CMD [ "/bin/bash", "/opt/run_cag.sh" ]