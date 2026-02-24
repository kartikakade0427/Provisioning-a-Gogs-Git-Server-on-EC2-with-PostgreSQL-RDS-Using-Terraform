#!/bin/bash
yum update -y
yum install -y git wget
wget https://dl.gogs.io/0.13.0/gogs_0.13.0_linux_amd64.tar.gz
tar -xzf gogs_0.13.0_linux_amd64.tar.gz
cd gogs
./gogs web &

