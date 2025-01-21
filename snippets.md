## Git

# re-write committer AND author
export YOUR_EMAIL=FOOBAR
export GIT_COMMITTER_EMAIL=${YOUR_EMAIL}
export GIT_COMMITTER_NAME='jm3'
git config --global user.email ${YOUR_EMAIL}
git config --global user.name jm3
git rebase -r SHA_BEFORE_THE_ISSUE --exec "git commit --amend --no-edit --author 'jm3 <${YOUR_EMAIL}>'"

# vim:set nospell ft=markdown

