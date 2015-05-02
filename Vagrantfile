# Vagrant config
require 'yaml'

vgroupconfig = YAML::load_file(File.join(File.dirname(__FILE__), '/ansible/group_vars/vagrant'))

# Check to determine whether we're on a windows or linux/os-x host,
# later on we use this to launch ansible in the supported way
# source: https://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby
def which(cmd)
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
            exe = File.join(path, "#{cmd}#{ext}")
            return exe if File.executable? exe
        }
    end
    return nil
end
Vagrant.configure("2") do |config|
	nfs = 'nfs'

	config.vm.provider :aws do |aws, override|
		nfs = 'rsync'

  		override.vm.box = "dummy"
		aws.access_key_id = ""
		aws.secret_access_key = ""
		aws.keypair_name = ""

	    aws.region = "eu-west-1"
		aws.ami = "ami-8e987ef9"
		aws.security_groups = [""]
		aws.instance_type = "t1.micro"

		override.ssh.username = "ubuntu"
		override.ssh.private_key_path = "~/.ssh/id_rsa"
	end

    config.vm.provider :virtualbox do |v|
        v.name = vgroupconfig['vagrant_vmname']
        v.customize ["modifyvm", :id, "--memory", 4096]
    end

    config.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "2048"
    end

    config.vm.provider :parallels do |parallels, override|
        parallels.memory = 2048
        override.vm.box = "parallels/ubuntu-14.04"
    end

    config.vm.box = "ubuntu/trusty64"

    config.vm.network :private_network, ip: vgroupconfig['vagrant_ip']
    config.ssh.forward_agent = true

    config.vm.synced_folder ".", vgroupconfig['symfony2_project_root'], type: nfs, mount_options: ['actimeo=2']
    config.vm.synced_folder "./", "/vagrant", disabled: true

    #############################################################
    # Ansible provisioning (you need to have ansible installed)
    #############################################################

    if which('ansible-playbook')
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/setup.yml"
            ansible.inventory_path = "ansible/inventories/dev"
            ansible.limit = 'all'
            #ansible.verbose = 'vvv'
        end

        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/update.yml"
            ansible.inventory_path = "ansible/inventories/dev"
            ansible.limit = 'all'
        end
    end
end
