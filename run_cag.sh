#!/bin/bash

cd /opt && /usr/bin/wget -O setup.sh https://concord.centrastage.net/csm/profile/downloadLinuxAgent/$DRMMSITE && /bin/sh setup.sh

cd /opt/CentraStage/ && /usr/bin/mono --debug --runtime=v4.0 UnixService.exe &
sleep 2
exec tail -f $( ls -Art /opt/CentraStage/log*txt* | tail -n 1 )