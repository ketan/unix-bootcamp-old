# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # config.vm.box_url = "http://domain.com/path/to/above.box"
  config.vm.box = "centos-6.3-x86_64-unix-bootcamp"
  config.vm.define 'centos-6.3-x86_64-unix-bootcamp' do |vm_config|
    vm_config.vm.host_name = 'unix-bootcamp.localdomain'

    vm_config.vm.customize ["modifyvm", :id, "--memory", (1024*4), '--name', vm_config.vm.host_name, '--cpus', 4]
  end

  # config.vm.boot_mode = :gui
  config.ssh.timeout = 400

  config.vm.share_folder "chef", "/chef", "chef"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.add_recipe "install"
  end
end
