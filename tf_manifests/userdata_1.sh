#!/bin/bash
amazon-linux-extras install -y docker
service docker start
usermod -a -G docker ec2-user
chkconfig docker on
yum install -y java-17-amazon-corretto.x86_64
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum -y upgrade
yum install -y jenkins
systemctl start jenkins
systemctl enable jenkins
yum install -y git
curl -O https://bootstrap.pypa.io/pip/3.7/get-pip.py
python3 get-pip.py --user
usermod -a -G docker jenkins