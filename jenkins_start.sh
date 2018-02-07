#!/bin/bash


docker container run -d --name jenkins-master -p 8080:8080 -p 50000:50000 -v jenkins:/var/jenkins_home --restart=always secpg/demo_conjur_docker_jenkins
