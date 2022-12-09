#!/bin/bash
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Pictures
mkdir Videos
for x in {1..5}
do
   mkdir folder$x
done
wget https://raw.githubusercontent.com/xMysT3ry/naloga6/main/users.txt
readarray -t desktop < users.txt
for x in {0..4}
do
  useradd -m -s /bin/bash ${desktop[x]}
  usermod -a -G sudo ${desktop[x]}
done
apt-get -y update
apt-get -y upgrade
apt-get -y install ufw
apt-get -y install git
apt-get -y install nginx
apt-get -y install net-tools
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg	
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
