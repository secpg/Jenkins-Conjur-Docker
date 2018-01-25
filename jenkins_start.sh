#!/bin/bash

docker volume create jenkins

docker network create jenkins

docker container run -d --name jenkins-master -p 8080:8080 -p 50000:50000 -v jenkins:/var/jenkins_home --restart=always captainfluffytoes/demo_conjur_docker_jenkins
