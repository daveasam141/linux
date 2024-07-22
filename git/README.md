### To create a git reppo
You must first either clone a repo from github or create one on command line using git init (reponame )

### To add a file to git repo 
cd into repo and create a file 
git add (filename) to repo

### To check on the status of the git repo 
git status 

### To commit a file to he repo 
git commit (filename) -m(m stands for commit message)

### To configure Git for ex add user 
git config 

### To set user on git 
git config

### To rename intial branch(usualy known as master or main)
git branch -m <name>

### To remove from git repo 
git rm --cached (filename)

### To push to remote repo
you must first add a remote repo as an origin. (This might have to be done in the git repo you intialized locally)
You do the above by: git add remote add orign (http url from remote repo)
after the remote repo has been added run : git push origin master(you can replace master if you're trying to push a different branch or master branch name is different)
when prompted to login, use githuub username and generate a personal access token under developer settings in github


### How to create a new branch in git 
git branch (branchname)

### To show all branches in your repo
 git branch -a 

 ### To switch to a different branch 
git checkout "branchname" 

### To delete a branch if its not merged 
git branch -D (branchname)

### To delete a branch if it has been merged 
git branch -d branchname 

### To create a new branch and immediately checkout to it 
git checkout -b (-b indicates new branch) (branchname)

### To merge a branch, go into the branch you want to merge the other branch into(usually the master) 
git merge (the branch you want to add to the current banch that you are currently in)

### To view git log 
git log 

### To push to an online git repo
git push (repo url) (branch that you want to push to remote)

### Instead of using a url you can set up an alias for your git remote repo 
git remote add origin(the alias name) (url for remote repo)
so now to push to remote repo you can just type origin instead of remote url

### To see remote origin or repos already stored on your machine in the directory that you clone in
git remote -v 

### If someone on your team has pushed new code to the master branch on the remote repo and you want to update your local system 
git pull origin master(yiu can replace master with the branch you want to pull from)

### To push a branch other that the master branch up to a local repo 
git push origin (branchname)



###########
Version control apps 
1. Bitbucket 
2. Github
3. Codecommit 
4. Gitlab 

Git manages these repos 

Devops tools 
1. Jenkins 
2. Gitlab 

Gitops tools 
1. ArgoCD 

Infrastructure as code tools 
1. Terraform 
2. Amazon Cloudformation 
3. Ansible 

Configuration Management apps 
1. Puppet 
2. CHEF 
3. Ansible 


