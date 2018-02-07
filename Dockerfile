FROM jenkins/jenkins:lts

USER root

RUN	apt-get update &&\
	apt-get install -qy git apt-utils curl dpkg jq libexpat1-dev libpython2.7-dev python2.7-dev vim &&\
	apt-get install -f -qy &&\
	rm -rf /var/lib/apt/lists/* &&\
	curl -L -O https://bootstrap.pypa.io/get-pip.py &&\
	python get-pip.py &&\
	pip install boto3 &&\
	curl -L -O https://github.com/cyberark/summon/releases/download/v0.6.5/summon-linux-amd64.tar.gz &&\
	tar -C /usr/local/bin -xzvf summon-linux-amd64.tar.gz &&\
	curl -L -O https://github.com/cyberark/conjur-cli/releases/download/v5.4.0/conjur_5.4.0-1_amd64.deb &&\
	dpkg -i conjur_5.4.0-1_amd64.deb &&\
	apt-get install -f -y &&\
	rm -f summon-linux-amd64.tar.gz &&\
	rm -f conjur_5.4.0-1_amd64.deb &&\
	curl -L -O https://github.com/cyberark/summon-conjur/releases/download/v0.5.0/summon-conjur-linux-amd64.tar.gz &&\
	tar -xvzf summon-conjur-linux-amd64.tar.gz &&\
	mkdir -p /usr/local/lib/summon/ &&\
	mv summon-conjur /usr/local/lib/summon/ &&\
	apt-get clean &&\
	rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

USER jenkins

EXPOSE 8080 50000
