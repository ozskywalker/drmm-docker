FROM ubuntu:focal

# This is what's required to get Datto RMM agent up and running

RUN apt-get -y update \
    && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install wget mono-devel

COPY run_cag.sh /opt/run_cag.sh

# Now, here you can add your desired packages here for extra functionality
# Such as  Speedtest scripts, and other useful toys.
#
# Remember, it's a container, it's as stripped down to be as lightweight as possible.
#

RUN apt-get -y install curl ncat iputils-ping traceroute tcptraceroute python3 \
    && ln -s /usr/bin/python3 /usr/bin/python

CMD [ "/bin/bash", "/opt/run_cag.sh" ]