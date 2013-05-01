#change into root home
cd ~
#install java
apt-get install openjdk-6-jre -y
echo JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::") >> /etc/environment

# increase file size limits
echo "root hard nofile 65353" >> /etc/security/limits.conf 
echo "root soft nofile 65353" >> /etc/security/limits.conf 
echo "session    required    pam_limits.so" >> /etc/pam.d/su
echo "session    required    pam_limits.so" >> /etc/pam.d/login
echo "session    required    pam_limits.so" >> /etc/pam.d/sshd
echo "session    required    pam_limits.so" >> /etc/pam.d/sudo

#download elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.4.tar.gz
tar xzvf elasticsearch-0.20.4.tar.gz
# TODO - download elastic search config files

#download graylog2 server
wget http://download.graylog2.org/graylog2-server/graylog2-server-0.11.0.tar.gz
tar xzvf graylog2-server-0.11.0.tar.gz
# TODO - download config files

#install mongodb
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
apt-get update
apt-get install mongodb-10gen=2.2.3
echo "mongodb-10gen hold" | dpkg --set-selections

#http://thetek.net/how-to/13-how-to/42-how-to-install-graylog2-on-ubuntu.html
