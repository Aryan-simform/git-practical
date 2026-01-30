# Git commands

git init --template: To create a new repo with the give path of git template.

git add: To add a file/directory to index/staging area

git commit/git commit -m: To add the snapshot in the local repo.

git remote add remote-name remote-url: To add upstream to repo.

git push remote-name branch-name:  to push the commited changes or a branch to remote


git cherry-pick commit-hash : To cherry pick a specific commit to be added on a branch

git merge branch-name : merge a branch on current branch creates a new commits and point to 2 parent commits i.e from 2 different branch.

git rebase branch-name: merge a branch on current branch but rewrites history.

**git tag  -a v0.0.0 commit-hash -m "message here"**: To create a tag 

**git squash**

<span>WARNING</span>: First make sure you commit your work—check that git status is clean (since git reset --hard will throw away staged and unstaged changes)
Reset the current branch to the commit just before the last 12:

`git reset --hard HEAD~12`

HEAD@{1} is where the branch was just before the previous command.

This command sets the state of the index to be as it would just
after a merge from that commit:

`git merge --squash HEAD@{1}`

Commit those squashed changes.  The commit message will be helpfully

prepopulated with the commit messages of all the squashed commits:

`git commit`


# delete/remove a commit

**git revert** : to undo a commit. it does that by introducing a new commit that reverts the changes introduced by another commit. It will not change the commit history 

i.e. assume we have 3 commits in a branch **A<-B<-C** and we want to revert commit C if we use revert to do that it create a commit B' which mask the changes done by C so it will become  **A<-B<-C<-B'**

it is considered a safer way to remove a commit if commit is pushed to remote.


**git reset**: reset current head, and depeding on mode chnages index/staging area and working statge.
 
git reset --soft: No change in index or working files, leaves all your changed files as changes to be commited 

git reset --mixed: Resets the index but not working tree changed files are as it is but not marked for changes, default behaviour for reset

git reset --hard: Resets index and working tree both anything that is untracked will be simply deleted 

Working Dir (coding ) -> Staging Area(Index) -> local Repo (git push)
git reset –soft/mixed/hard –HEAD~N -> mixed is default

`git reset --soft HEAD~N   # will move file/changes  from local commit to staging area`

`git reset --mixed HEAD~N  #will move file/changes  from local commit to working directory`

`git reset --hard HEAD~N  #will delete file /changes from working directory `



