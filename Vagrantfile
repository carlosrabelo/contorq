IPRANGE = "192.168.56."

MASTER_NUMBER = 1
MASTER_IP_SUFFIX  = 19

NODE_NUMBER = 1
NODE_IP_SUFFIX  = 24

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.box_version = "11.20220912.1"
  config.vm.box_check_update = false

  (1..MASTER_NUMBER).each do |i|
    config.vm.define "s2-master-#{i}" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.name = "s2-master-#{i}"
        vb.memory = 4096
        vb.cpus = 2
      end

      node.vm.hostname = "s2-master-#{i}"
      node.vm.network :private_network, ip: IPRANGE + "#{MASTER_IP_SUFFIX + i}"

      node.vm.provision :ansible do |a|
        a.playbook = "contorq-m.yml"
        a.extra_vars = {
          ansible_ssh_user: "vagrant",
          ansible_python_interpreter: "/usr/bin/python3",
        }
      end
    end
  end

  (1..NODE_NUMBER).each do |i|
    config.vm.define "s2-node-#{i}" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.name = "s2-node-#{i}"
        vb.memory = 2048
        vb.cpus = 2
      end

      node.vm.hostname = "s2-node-#{i}"
      node.vm.network :private_network, ip: IPRANGE + "#{NODE_IP_SUFFIX + i}"

      node.vm.provision :ansible do |a|
        a.playbook = "contorq-n.yml"
        a.extra_vars = {
          ansible_ssh_user: "vagrant",
          ansible_python_interpreter: "/usr/bin/python3",
        }
      end
    end
  end
end
