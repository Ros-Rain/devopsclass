#!/bin/bash
# Java + dependencies
sudo apt update
sudo apt install openjdk-8-jre -y
sudo apt install wget unzip -y

# Docker + Docker Compose
wget -O - https://get.docker.com | bash
