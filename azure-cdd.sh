#!/bin/bash -x

echo "INFO: Preparing Azure instance for Cloudera Director"
echo "INFO: Installing packages"
yum -y update; yum -y install git curl wget vim python-pip screen mariadb bind bind-utils

# Timezone change if you want it?
#cp -p /etc/sysconfig/clock /etc/sysconfig/clock.orig
#sed -e 's/New_York/Los_Angeles/' /etc/sysconfig/clock.orig > /etc/sysconfig/clock
#mv /etc/localtime /etc/localtime.orig
#ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

echo "INFO: Installing Java 8 JDK from Oracle
URL=http://download.oracle.com/otn-pub/java/jdk/8u101-b13
RPM=jdk-8u101-linux-x64.rpm
curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" ${URL}/${RPM} > /tmp/${RPM}
sudo rpm -i /tmp/${RPM}

echo "INFO: Configuring Cloudera Director YUM Repo"
sudo wget "http://archive.cloudera.com/director/redhat/7/x86_64/director/cloudera-director.repo" -O /etc/yum.repos.d/cloudera-director.repo
echo "INFO: Installing Cloudera Director from RPMs"
sudo yum -y update; sudo yum -y install cloudera-director-server cloudera-director-client

echo "INFO: Starting Cloudera Director"
sudo service cloudera-director-server start

echo "...Ending Azure instance prep"
exit 0
