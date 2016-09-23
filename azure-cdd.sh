#!/bin/bash

echo "INFO: Preparing Azure instance for Cloudera Director"
echo "INFO: Installing packages"
sudo yum -y update
sudo yum -y install git curl wget vim python-pip screen mariadb mariadb-server bind bind-utils

echo "INFO: Installing Java 8 JDK from Oracle"
URL="http://download.oracle.com/otn-pub/java/jdk/8u101-b13"
RPM="jdk-8u101-linux-x64.rpm"
curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" ${URL}/${RPM} > /tmp/${RPM}
sudo yum -y install /tmp/${RPM}

echo "INFO: Configuring Cloudera Director YUM Repo"
sudo wget "http://archive.cloudera.com/director/redhat/7/x86_64/director/cloudera-director.repo" -O /etc/yum.repos.d/cloudera-director.repo
echo "INFO: Installing Cloudera Director from RPMs"
sudo yum -y update
sudo yum -y install cloudera-director-server cloudera-director-client

echo "INFO: Starting Cloudera Director"
sudo service cloudera-director-server start

echo "INFO: Cloning Director Scripts Github Repo"
git clone https://github.com/cloudera/director-scripts.git /home/cloudera/director-scripts

echo "INFO: Ending Azure instance prep"
