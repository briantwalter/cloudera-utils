#!/bin/bash

YUMCMD="yum"

echo "INFO: Adding kernel exclude to /etc/yum.conf"
echo "exclude=kernel*" >> /etc/yum.conf

echo "INFO: Preparing Azure instance for Cloudera Director"
echo "INFO: Installing packages"
sudo ${YUMCMD} -y update
sudo ${YUMCMD} -y install git curl wget vim python-pip screen mariadb mariadb-server bind bind-utils

echo "INFO: Installing Java 8 JDK from Oracle"
URL="http://download.oracle.com/otn-pub/java/jdk/8u111-b14"
RPM="jdk-8u111-linux-x64.rpm"
curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" ${URL}/${RPM} > /tmp/${RPM}
sudo ${YUMCMD} -y install /tmp/${RPM}

echo "INFO: Configuring Cloudera Director YUM Repo"
sudo wget "http://archive.cloudera.com/director/redhat/7/x86_64/director/cloudera-director.repo" -O /etc/yum.repos.d/cloudera-director.repo
echo "INFO: Installing Cloudera Director from RPMs"
sudo ${YUMCMD} -y update
sudo ${YUMCMD} -y install cloudera-director-server cloudera-director-client

echo "INFO: Starting Cloudera Director"
sudo service cloudera-director-server start

echo "INFO: Cloning Director Scripts Github Repo"
git clone https://github.com/cloudera/director-scripts.git ${HOME}/director-scripts

echo "INFO: Ending Azure instance prep"
