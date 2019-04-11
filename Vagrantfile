# -*- mode: ruby -*-
# vi: set ft=ruby :

FRIEND_SITE_ROOT='/Users/zara/dev/fronds'.freeze
FRIEND_SITE_FOLDER='fronds'.freeze
VM_DOC_ROOT='/var/www/html/fronds'.freeze
VM_BIND_ROOT='/opt/bind'.freeze
FRONDS_HOSTNAME='fronds.local'.freeze
PERM_GROUP='staff'.freeze

# All Vagrant configuration is done below. The '2' in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure('2') do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  config.vm.hostname = FRONDS_HOSTNAME
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = 'bento/ubuntu-16.04'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false
  if Vagrant.has_plugin?('vagrant-omnibus')
    config.omnibus.chef_version = 'latest'
  end
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing 'localhost:8080' will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network 'forwarded_port', guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network 'forwarded_port', guest: 80, host: 8080, host_ip: '127.0.0.1'
  config.vm.network 'forwarded_port', guest: 3306, host: 3306, host_ip: '127.0.0.1'
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip: '192.168.33.10'

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network 'public_network'

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder FRIEND_SITE_ROOT, VM_BIND_ROOT, type: :nfs
  config.vm.synced_folder '.', '/vagrant', disabled: true

  if Vagrant.has_plugin?('vagrant-bindfs')
    config.bindfs.bind_folder VM_BIND_ROOT, VM_DOC_ROOT
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '2048'
    vb.cpus = 2
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w[./ ../berks-cookbooks]

    chef.json = {
        fronds:  {
            site_folder: FRIEND_SITE_FOLDER,
            vm_doc_root: VM_DOC_ROOT,
            perm_group: PERM_GROUP
        }
    }
    chef.run_list = [
        'recipe[fronds::default]'
    ]
  end
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision 'shell', inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
