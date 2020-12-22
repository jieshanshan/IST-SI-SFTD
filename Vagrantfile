# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "study-vm"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096 # 4GB RAM
    vb.cpus = 2
  end

  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 9000, host: 9000 #SonarQube
  config.vm.network "forwarded_port", guest: 8888, host: 8888 #JupyterLab (Password: sonar)

  config.vm.synced_folder "study.d", "/home/vagrant/study.d"
  config.vm.synced_folder "docker", "/home/vagrant/docker"
  
  # Install docker
  config.vm.provision :docker

  # Install docker-compose, jupyter, postgres, sonarqube 
  config.vm.provision :docker_compose, 
      yml: "/home/vagrant/docker/docker-compose.yml", 
      run: "always"

  # Install sonar-scanner
  config.vm.provision :shell, inline:<<-SCRIPT
apt-get -y install unzip
mkdir -p /home/vagrant/study.d/vendor
curl -so /home/vagrant/study.d/vendor/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
[ -d /home/vagrant/study.d/vendor/sonar-scanner ] || ( unzip -q /home/vagrant/study.d/vendor/sonar-scanner.zip -d /home/vagrant/study.d/vendor/ && mv /home/vagrant/study.d/vendor/sonar-scanner-3.3.0.1492-linux /home/vagrant/study.d/vendor/sonar-scanner )
rm /home/vagrant/study.d/vendor/sonar-scanner.zip
SCRIPT

end
