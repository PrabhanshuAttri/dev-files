# sourcing bashrc
source ~/.bashrc

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PATH=/usr/local/bin:$PATH
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# jedis in disguise

# change directory
function app() {
    # path to specific dir
    cd ~/github/dev-files
}

# view logs
function log() {
    cd ~/log/dir
    tail -f error.log
}

# show n running process (sorted by user)
function kylo() {
    if [ $# -eq 0 ]
    then
        ps aux | sort -n -k 1 | head -n 20
    else
        ps aux | sort -n -k 1 | head -n $1
    fi
}

# kill process
function vader() {
    for process in "$@";
    do
        kill -9 $process;
    done
}

# clear cache
function safai() {
    cd ~/path/to/cache/
    rm -rf *
}

# pull latest code in master branch
function luke() {
    git checkout master
    git pull remote_origin master
    git push origin master
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

function br() {
    git branch
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

function gs() {
    git status
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
