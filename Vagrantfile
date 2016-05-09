# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/precise32"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, guest: 9200, host: 9200

  config.vm.provider "virtualbox" do |v|
    v.customize [ "modifyvm", :id, "--memory", "2048" ]
    v.customize [ "modifyvm", :id, "--cpus", "2" ]
    v.customize [ "modifyvm", :id, "--cpuexecutioncap", "50" ]
    v.customize [ "modifyvm", :id, "--ioapic", "on" ]
  end

end
