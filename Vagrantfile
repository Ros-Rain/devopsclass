Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.boot_timeout = 900

  config.vm.define "dz3_jenkins" do |build|
	build.vm.box = "geerlingguy/ubuntu1804"
    build.vm.hostname = "jenkins"
	build.vm.network "private_network", ip: "192.168.3.70"
	build.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
		vb.name = "dz3_jenkins"
		vb.cpus = "1"
	end
	build.vm.provision "shell", path: "userdata/jenkins-setup.sh"
  end

  config.vm.define "dz3_nexus" do |nexus|
    nexus.vm.box = "geerlingguy/centos7"
	nexus.vm.hostname = "nexus"
    nexus.vm.network "private_network", ip: "192.168.3.71"
	nexus.vm.provider "virtualbox" do |vb|
     vb.memory = "4096"
	 vb.cpus = "4"
     vb.name = "dz3_nexus"
	end
	nexus.vm.provision "shell", path: "userdata/nexus-setup.sh"
  end

  config.vm.define "dz3_vproapp" do |vproapp|
    vproapp.vm.box = "geerlingguy/ubuntu1804"
	vproapp.vm.hostname = "vproapp"
    vproapp.vm.network "private_network", ip: "192.168.3.72"
	vproapp.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
	 vb.cpus = "1"
     vb.name = "dz3_vproapp"
	end
	vproapp.vm.provision "shell", path: "userdata/base-setup.sh"
  end

end
