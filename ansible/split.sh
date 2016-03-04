#!/usr/bin/env bash

git subsplit init git@github.com:LewisW/ansible-symfony-playbook.git
git subsplit publish "
ansible/roles/apache-extra:git@github.com:vivait/ansible-apache-extra.git
ansible/roles/backup:git@github.com:vivait/ansible-backup.git
ansible/roles/bash:git@github.com:vivait/ansible-bash.git
ansible/roles/cachetool:git@github.com:vivait/ansible-cachetool.git
ansible/roles/daemonize:git@github.com:vivait/ansible-daemonize.git
ansible/roles/firewall:git@github.com:vivait/ansible-firewall.git
ansible/roles/migrate:git@github.com:vivait/ansible-migrate.git
ansible/roles/permissions:git@github.com:vivait/ansible-permissions.git
ansible/roles/php-extra:git@github.com:vivait/ansible-php-extra.git
ansible/roles/php-twig:git@github.com:vivait/ansible-php-twig.git
ansible/roles/rackspace-monitoring:git@github.com:vivait/ansible-rackspace-monitoring.git
ansible/roles/services:git@github.com:vivait/ansible-services.git
ansible/roles/ssh:git@github.com:vivait/ansible-ssh.git
ansible/roles/symfony2:git@github.com:vivait/ansible-symfony2.git
ansible/roles/system-packages:git@github.com:vivait/ansible-system-packages.git
ansible/roles/versioned-deployment:git@github.com:vivait/ansible-versioned-deployment.git
" --heads=master

rm -rf .subsplit/
