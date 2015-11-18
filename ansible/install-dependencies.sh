#!/usr/bin/env bash
cd $(dirname $0)

if ! hash ansible-playbook 2>/dev/null; then
	sudo easy_install pip
	sudo -H pip install ansible==1.9.1 markupsafe --allow-external mysql-connector-python mysql-connector-python --quiet
	sudo -H pip install mysql-python boto
fi

if [ "$1" != "" ];
then
	ROLES="-p $1"
else
	ROLES=
fi

sudo ansible-galaxy install -r requirements.txt --ignore-errors --force $ROLES
