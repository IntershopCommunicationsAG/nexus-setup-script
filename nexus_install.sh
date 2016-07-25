#!/bin/sh

yum -y install java-1.8.0-openjdk
cd /tmp
wget --no-check-certificate -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
mkdir -p /opt/sonatype-nexus /opt/sonatype-work /opt/sonatype-work/nexus
tar -zxvf /tmp/nexus-latest-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
useradd --user-group --system --home-dir /opt/sonatype-nexus nexus
chown -R nexus:nexus /opt/sonatype-work /opt/sonatype-nexus /opt/sonatype-work/nexus
cp /opt/sonatype-nexus/bin/nexus /etc/init.d/
sed -i 's/NEXUS_HOME=\"\.\.\"/NEXUS_HOME=\"\/opt\/sonatype-nexus\"/g' /etc/init.d/nexus
sed -i 's/\#RUN_AS_USER=/RUN_AS_USER=nexus/g' /etc/init.d/nexus
cd /etc/init.d
chkconfig --level 345 nexus on
/etc/init.d/nexus start