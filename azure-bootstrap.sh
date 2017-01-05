#!/bin/bash

YUMCMD="yum"

echo "INFO: Installing packages"
sudo ${YUMCMD} -y update
sudo ${YUMCMD} -y install git curl wget vim python-pip screen

echo "INFO: Installing Java 8 JDK from Oracle"
URL="http://download.oracle.com/otn-pub/java/jdk/8u111-b14"
RPM="jdk-8u111-linux-x64.rpm"
curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" ${URL}/${RPM} > /tmp/${RPM}
sudo ${YUMCMD} -y install /tmp/${RPM}

echo "INFO: Ending Azure instance prep"
