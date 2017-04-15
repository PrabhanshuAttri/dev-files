# sourcing bashrc
source ~/.bashrc

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PATH=/usr/local/bin:$PATH
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

REMOTE_ORIGIN="remote_origin"
ORIGIN="origin"
MASTER="master"

# jedis in disguise
# show n running process (sorted by user)
function kylo() {
    if [ $# -eq 0 ]
    then
        ps aux | sort -n -k 1 | head -n 20
    else
        ps aux | sort -n -k 1 | head -n $1
    fi
}

function vader() {
    for process in "$@";
    do
        kill -9 $process;
    done
}

# remote ssh login
alias remote_in="ssh username@192.0.0.0"
alias zdevd="ssh prabhanshu.zdev.net"
alias mount="sshfs username@192.0.0.0:/var/dir ~/local_dir"
alias app="cd ~/github"
# opens last opened screen
alias sc="screen -d -RR"
alias log="tail -f ~/log/dir/error.log"
alias safai="rm -rf ~/path/to/cache/*"
# git
alias gs="git status"
alias br="git branch"
alias stash="git stash"
alias pop="git stash pop"
alias list="git stash list"
alias drop="git stash drop"
# Sync branch from remote
alias bync="git fetch --prune"

# pull latest code in master branch
function luke() {
    stash
    jump $MASTER
    git pull $REMOTE_ORIGIN $MASTER
    push
}

# pull latest code in current branch
function darkside() {
    git pull remote_origin master
    git push origin master
}

function add() {
    if [ $# -ne 0 ]
    then
        git add $1
    fi
}

function jump() {
    if [ $# -ne 0 ]
    then
        git checkout $1
    fi
}

function hunt() {
    git grep $1
}

function gap() {
    if [ $# -eq 0 ]
    then
        git diff
    else
        git diff $1
    fi
}

# updates all dependencies in package.json
function syncnpm() {
    npm i -g npm-check-updates
    npm-check-updates -u
    npm install
}

function blush() {
    if [ $# -ne 0 ]
    then
        read -r -p "Are you sure you want to delete $1 branch? [y/N] " response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
        then
            git push $ORIGIN --delete $1
            git branch -d $1
        fi
    fi
}
