HOST=$1
ssh $HOST <<!
	sudo yum remove docker -y \
                  docker-common -y \
                  container-selinux -y \
                  docker-selinux -y \
                  docker-engine -y \
		  epel-release -y \
                  python-pip -y \	
                  docker-engine-selinux -y
	sudo yum check-update -y
	curl -fsSL https://get.docker.com/ | sh
	sudo systemctl start docker 
	sudo systemctl status docker 
	sudo systemctl enable docker 
	sudo usermod -aG docker $(whoami) 
	sudo usermod -aG docker centos
	sudo yum install epel-release -y
	sudo yum install -y python-pip -y
	sudo pip install docker-compose 
	sudo yum upgrade python* -y
	sudo dockerd -H=tcp://0.0.0.0:2376 -H=unix:///var/run/docker.sock  &	
	!
