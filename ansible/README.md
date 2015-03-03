# Adding to your repository
 
```bash
git remote add -f ansible https://github.com/LewisW/ansible-symfony-playbook.git
git subtree add --prefix=ansible ansible master --squash
```

# Pulling updates & changes
```bash
git fetch ansible master
git subtree pull --prefix=ansible ansible master --squash
```

# Pushing back changes
```bash
git subtree push --prefix=ansible ansible master
```
Be careful not to push your per-project customisations.
