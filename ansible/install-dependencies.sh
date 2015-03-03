#!/usr/bin/env bash
cd $(dirname $0)

if ! hash ansible-playbook 2>/dev/null; then

	#if hash apt-get 2>/dev/null; then
	#	sudo apt-get update
	#	sudo apt-get install -y software-properties-common
    #    sudo apt-add-repository -y ppa:ansible/ansible
    #    sudo apt-get update
    #    sudo apt-get install -y ansible
	#else
		sudo easy_install pip
		sudo -H pip install ansible markupsafe --quiet
	#fi
fi

sudo ansible-galaxy install -r requirements.txt -p ./roles/ --ignore-errors
