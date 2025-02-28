# !/bin/bash

export PYENV_ROOT=/usr/local/var/pyenv
export PATH=$PATH:~/.dotfiles/bin:$PYENV_ROOT/shims:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/maven/bin:~/.bin:/opt/gradle/bin:/opt/play:/opt/spark/bin:/opt/graalvm/bin:$JAVA_HOME/bin:$JAVA_HOME/jre/languages/js/bin/:~/.npm-global/bin/:$HOME/.cargo/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:/usr/local/texlive/2011/bin/x86_64-darwin/:$HOME/.bin/:/usr/local/opt/kafka/bin:/usr/local/sbin
export SCALA_HOME=/opt/scala
export GRADLE_HOME=/opt/gradle:$HOME/.bin/
export EDITOR=/usr/bin/vi
export DISPLAY=:0.0
export NODE_PATH=$NODE_PATH:/user/local/lib/node_modules

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_HOST_OVERRIDE=$(colima ls -j | jq -r '.address')
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

#ODBC/Athena stuff
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

export SBT_NATIVE_CLIENT=true

alias mvnskiptest='mvn -Dmaven.test.skip=true'

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias xmlpost='curl -H "Content-Type: text/xml" -v -d "`cat $1`" -X POST $2'
alias jsonpost='curl -H "Content-Type: application/json" -v -d "`cat $1`" -X POST $2'

alias gsa='find . -type d -maxdepth 1 | xargs -I{} sh -c "echo {}; cd {}; git status | grep modified || true"'

#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm

alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

alias lg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

alias commit=prme

function shuv() { prme -m "${1:-x}" }

function shunt() { 
    git branch "${1}" &&
    git checkout main &&
    git reset --hard HEAD~${2:-1} &&
    git checkout "${1}"
}

function iso_date() {
    date $@ -u +%FT%T%z 
}

function kill_zombies() {
    pmset -g assertions | egrep -A 1 "PreventUserIdleSystemSleep named" | grep "Created for PID" | grep -o '[0-9]*' | xargs kill -9 
}

eval "$(pyenv init --path)"

export LS_COLORS="fi=01;37:di=01;34:ex=01;32:ln=37\
:or=01;30:mi=00:mh=31\
:pi=33:so=43;30:do=35\
:bd=35;01:cd=35\
:su=37;41:sg=30;43:ca=30;41\
:tw=07;34:ow=30;44:st=30;44"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.private.sh" ]] && source "$HOME/.private.sh"

alias ls='gls -GCF --group-directories-first --color'

function dstop() {
    if [[ $# -eq 0 ]]; then
        docker stop $(docker ps -q)
    else   
        docker ps | grep $1 | awk '{print $1}' | xargs docker stop
    fi
}

function dkill() {
    dstop $1
}

function gcleanup() {
     git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}' ); do git branch -D $branch; done
}

set -o vi

. "$HOME/.local/bin/env"
