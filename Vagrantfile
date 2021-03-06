# -*- mode: ruby -*-

Vagrant.require_version ">= 2.2.13"
Vagrant.configure(2) do |config|
  config.vm.box = "debian/buster64"
  config.vm.hostname = "foobar-vagrant"
  config.vm.network "private_network", ip: "192.168.99.10"
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # https://github.com/dotless-de/vagrant-vbguest/issues/351
  if ENV['FIRST_RUN'] == 'true'
    config.vbguest.auto_update = false
    config.vm.synced_folder ".", "/vagrant", disabled: true
  else
    config.vm.synced_folder ".", "/vagrant", type: (ENV["VAGRANT_SYNC"] || "virtualbox")
  end

  config.ssh.forward_agent = true


  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

    vb.customize ["modifyvm", :id, "--cpus", (ENV["VAGRANT_CPU"] || "4")]
    vb.customize ["modifyvm", :id, "--memory", (ENV["VAGRANT_RAM"] || "4096")]
  end

  config.vm.provision "shell", privileged: false,
                               path: "vagrant/install.sh",
                               args: ENV["LOGNAME"],
                               env: {'DB_DATA_VOLUME': "$HOME/db/"}
end
