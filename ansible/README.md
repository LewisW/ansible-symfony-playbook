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
git checkout ansible
git cherry-pick <commit>
git push ansible/master
```

## Cherry picking mixed commits
Otherwise if you've mixed project related commits with ansible commits that you wish to push back, you'll need to filter the commits after doing a checkout from your project branch:

```bash
git checkout ansible
git checkout my_project -- ansible
# Filter any project related changes from the files
git commit -m "Merged in updates from project X"
git push ansible/master
```
