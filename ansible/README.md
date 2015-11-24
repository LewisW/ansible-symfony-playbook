# Getting started
The intention of this repository is to sit inside your main repository and be customised and tweaked. Everything apart from the roles, is intended as a starting point, and so should be customised as you see fit.

## Adding to your repository
 
```bash
git remote add -f ansible https://github.com/LewisW/ansible-symfony-playbook.git
git merge --squash ansible/master
```

## Creating inventory files
You can create as many inventories as you see fit, but there is special behaviour for production and staging groups, so it's recommended you create them.

### Build
The [build inventory](https://github.com/LewisW/ansible-symfony-playbook/blob/master/ansible/inventories/build) comes with this repository. However, by default it will install everything on build. Your project does not need search (elasticsearch), database (mysql), or caching (memcached) then you can remove `build` from the appropriate group, and leave just the heading.

### Staging
To create a staging inventory, duplicate the [build inventory](https://github.com/LewisW/ansible-symfony-playbook/blob/master/ansible/inventories/build) and change any instances of the word `build` with `staging`. You can then put the IPs/hostnames of any staging servers under the `[staging]` group.

### Production
To create a production inventory, duplicate the [build inventory](https://github.com/LewisW/ansible-symfony-playbook/blob/master/ansible/inventories/build) and change any instances of the word `build` with `production`. You can then put the IPs/hostnames of any production servers under the `[production]` group.

## Pulling updates & changes
From time-to-time, you may wish to merge the upstream changes with your local changes. This process will involve carefully inspecting each upstream change before deciding whether is it appropriate to merge in to your local customisations.

```bash
git fetch ansible
git merge --squash ansible/master
```


# Contributing
## Pushing back changes
### Cherry picking an ansible only commit
If the change you want to pash back upstream is in a commit that is separate to any changes that you don't want to push (i.e. doesn't contain any project related commmits), simple switch to the ansible branch and cherry pick the changes from your git log:
```bash
git checkout ansible
git pull
git cherry-pick <commit>
git push ansible/master
```

## Cherry picking mixed commits
Otherwise if you've mixed project related commits with ansible commits that you wish to push back, you'll need to filter the commits after doing a checkout from your project branch:

```bash
git checkout ansible
git pull
git checkout my_project -- ansible
# Filter any project related changes from the files
git commit -m "Merged in updates from project X"
git push ansible/master
```

# Provisioning
```
ansible-playbook ansible/setup.yml -i ansible/inventories/prod
```

# Deploying
```
ansible-playbook ansible/update.yml -i ansible/inventories/prod
```
