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

function rey() {
  if [ $# -eq 1 ]
  then
    ps aux | grep $1 | awk '{print $2}' | xargs kill -9
  else
    echo "Please provide process name to search. Eg. rey zsh"
  fi
}

function vader() {
  for process in "$@";
  do
    kill -9 $process;
  done
}

alias root="cd ~/github"

# remote ssh login
alias remote_in="ssh username@192.0.0.0"
alias mount="sshfs username@192.0.0.0:/var/dir ~/local_dir"
alias log="tail -f ~/log/dir/error.log"
alias safai="rm -rf /path/to/cache/*"

# opens last opened screen
alias sc="screen -d -RR"

# git
alias gits="git status"
alias br="git branch"
alias stash="git stash"
alias pop="git stash pop"
alias list="git stash list"
alias drop="git stash drop"
alias master="git checkout master"
# Sync branch from remote
alias bync="git fetch --prune"
alias exportenv="while read line; do export $line; done < ./.env;"
alias exportheroku="while read line; do heroku config:set $line; echo $line; done < ./.env;"

# kills ssh-agents
function sshkiller() {
  ps aux | grep -v 'grep ssh-agent -s' | grep 'ssh-agent -s' | awk '{print $2}' | while read a; do vader "$a"; done
}

# git log in
function sin() {
  sshAgentCount=$(ps aux | grep -v 'grep ssh-agent -s' | grep 'ssh-agent -s' | wc -l | awk '{$1=$1};1')
  echo $sshAgentCount
  if [ $sshAgentCount -lt 2 ]
  then
    eval "$(ssh-agent -s)"
    for f in `find ~/.ssh -name '*_rsa'`; do ssh-add $f; done;
  fi
}

function gdiff() {
  if [ $# -eq 0 ]
  then
    git diff -w
  else
    git diff -w $1
  fi
}

function hunt() {
  git grep $1
}

function add() {
  for file in "$@";
  do
    git add $file
  done
}

function jump() {
  if [ $# -ne 0 ]
  then
    git checkout $1
  fi
}

function luke() {
  original_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  echo "Branch: $original_branch"
  stash
  # minutes after which master will be updated from remote_origin
  update_delta=30
  export NOW_TIME="$(date +%s)"
  isset_PULL_TIME=${PULL_TIME:- false}
  last_run=$[ $((NOW_TIME- ${PULL_TIME:- $((NOW_TIME - (update_delta * 30)))})) / update_delta]
  export NEXT_UPDATE="$(( update_delta-last_run ))"
  if (( "$isset_PULL_TIME" ));
  then
    echo "Last updated master: $last_run minutes ago."
  else
    echo "Last updated master: ages ago."
  fi
  if [ "$original_branch" != "$MASTER" ]
  then
    jump $MASTER
  fi
  if (( (last_run) >= update_delta ));
  then
    echo "Updating now."
    git pull $REMOTE_ORIGIN $MASTER
    push
    export PULL_TIME="$(date +%s)"
    export NEXT_UPDATE=$update_delta
  fi
  echo "Next update in $NEXT_UPDATE minutes."
}

# TODO
# git fetch $REMOTE_ORIGIN
# git rebase -p "$ORIGIN/$MASTER
function darkside() {
  original_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  luke

  if [ "$original_branch" != "$MASTER" ]
  then
    current_branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    if [ "$original_branch" != "$current_branch" ]
    then
      echo "Jump back: $original_branch"
      jump $original_branch
    fi
    git pull $ORIGIN $MASTER
    push
  fi
}

function push() {
  branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  echo "Pushing $branch"
  if [ $# -eq 0 ]
  then
    git push $ORIGIN $branch
  else
    git push $ORIGIN $branch $1
  fi
}

# updates all dependencies in package.json
function syncnpm() {
  if [ $# -ne 0 ]
  then
    if [ "$1" == "g" ]
    then
      npm i -g npm-check-updates
    fi
  fi
  ncu -u
  npm install
}

# permanently deletes the branch
function blush() {
  remote=all
  if [ $# -ne 0 ]
  then
    if [ $# -eq 1 ]
    then
      read -r -p "Are you sure you want to delete $1 branch from local? [y/N] " response
      if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
      then
        git branch -d $1
      fi
      echo "1" $1
    elif [ $# = 2 ] && [ $2 = $remote ]
    then
      echo "2"
      read -r -p "Are you sure you want to delete $1 branch from local as well as remote? [y/N] " response
      if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
      then
        git push $ORIGIN --delete $1
        git branch -d $1
        git branch -D $1
      fi
    else
      echo "Usage:"
      echo "For local: blush branchname"
      echo "or"
      echo "For local and remote: blush branchname all"
    fi
  fi
}
