# Installation
 
```bash
git remote add -f ansible https://github.com/LewisW/ansible-symfony-playbook.git
git subtree add --prefix=ansible ansible master --squash
```

# Updating
```bash
git fetch ansible master
git subtree pull --prefix=ansible ansible master --squash
```

# Committing changes
```bash
git subtree push --prefix=ansible ansible master
```
