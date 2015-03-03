# Adding to your repository
 
```bash
git remote add -f ansible https://github.com/LewisW/ansible-symfony-playbook.git
git merge --squash ansible/master
```

# Pulling updates & changes
```bash
git pull -s subtree ansible master
```

# Pushing back changes
## Cherry picking an ansible only commit
If the change you want to pash back upstream is in a commit that is separate to any changes that you don't want to push (i.e. doesn't contain any project related commmits), simple switch to the ansible branch and cherry pick the changes from your git log:
```bash
git checkout -b ansible
git cherry-pick <commit>
git push ansible/master
```

## Cherry picking mixed commits
Otherwise if you've mixed project related commits with ansible commits that you wish to push back, you'll need to filter the commits after cherry picking then:

```bash
git checkout -b ansible
git cherry-pick -n <commit>
# Filter any project related commits here
# The following filters any commits outside of the ansible directory
#git filter-branch --prune-empty --subdirectory-filter ansible/
git push ansible/master
```
