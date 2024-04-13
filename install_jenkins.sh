#!/bin/bash
# Actualiza los paquetes y el sistema
sudo yum update -y

# Instala Java, necesario para Jenkins
amazon-linux-extras install java-openjdk11 -y

#Add Repo
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Agrega el repositorio de Jenkins y su clave
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#upgrade
sudo yum upgrade

# Instala Jenkins
sudo yum install jenkins -y

# Inicia y habilita Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
