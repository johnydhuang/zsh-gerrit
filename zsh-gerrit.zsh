function gerrit_reviewers() {
# echo "%r=a@a.com,r=b@b.com,r=c@c.com"
echo ""
}
gpr() {
local reviewers=$(gerrit_reviewers)
if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "HEAD:refs/for/${*}${reviewers}"
else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "HEAD:refs/for/${b:=$1}${reviewers}"
fi
}
compdef _git gpr=git-checkout
gpr!() {
local reviewers=$(gerrit_reviewers)
if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "HEAD:refs/drafts/${*}${reviewers}"
else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "HEAD:refs/drafts/${b:=$1}${reviewers}"
fi
}
compdef _git gpr!=git-checkout