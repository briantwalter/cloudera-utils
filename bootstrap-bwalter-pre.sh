#!/bin/bash

echo "...Starting Custom Pre-Bootstrap"

yum -y update; yum -y install git curl wget vim python-pip screen
cp -p /etc/sysconfig/clock /etc/sysconfig/clock.orig
sed -e 's/New_York/Los_Angeles/' /etc/sysconfig/clock.orig > /etc/sysconfig/clock
mv /etc/localtime /etc/localtime.orig
ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

URL=http://download.oracle.com/otn-pub/java/jdk/8u77-b03
RPM=jdk-8u77-linux-x64.rpm

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" ${URL}/${RPM} > /tmp/${RPM}
sudo rpm -i /tmp/${RPM}

echo "...Ending Custom Pre-Bootstrap"
exit 0
