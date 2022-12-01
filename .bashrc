# !/bin/bash

export PYENV_ROOT=/usr/local/var/pyenv
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-19.2.1/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$PATH:$PYENV_ROOT/shims:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/maven/bin:~/.bin:/opt/gradle/bin:/opt/play:/opt/spark/bin:/opt/graalvm/bin:$JAVA_HOME/bin:$JAVA_HOME/jre/languages/js/bin/:~/.npm-global/bin/:$HOME/.cargo/bin:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:/usr/local/texlive/2011/bin/x86_64-darwin/:$HOME/.bin/:/usr/local/opt/kafka/bin:/usr/local/sbin
export CLASSPATH=$CLASSPATH:~/.m2/repository/commons-lang/commons-lang/2.3:~/.classpath/
export MAVEN_OPTS="-Xmx1024m -Djava.awt.headless=true" #-javaagent:/opt/jrebel/jrebel.jar"
export SCALA_HOME=/opt/scala
export GRADLE_HOME=/opt/gradle:$HOME/.bin/
export EDITOR=/usr/bin/vi
export DISPLAY=:0.0
#export PYTHONPATH=$HOME/.bin/:$PYTHONPATH
export NODE_PATH=$NODE_PATH:/user/local/lib/node_modules
#export SPARK_HOME=/opt/spark

#ODBC/Athena stuff
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export ODBCINI=/usr/local/odbc/odbc.ini
export ODBCINSTINI=/usr/local/odbc/odbcinst.ini
export SIMBA_ATHENA_ODBC_INI=/etc/simba.athenaodbc.ini

export PW_TEST_ENV=staging
export PW_TEST_LIB=/Users/jho/dev/system_test

export SBT_NATIVE_CLIENT=true

export COURSIER_REPOSITORIES="ivy2Local|central|sonatype:releases|jitpack|https://nexus.int.protectwise.net/content/repositories/releases/"

alias mvnskiptest='mvn -Dmaven.test.skip=true'

alias xmlpost='curl -H "Content-Type: text/xml" -v -d "`cat $1`" -X POST $2'
alias jsonpost='curl -H "Content-Type: application/json" -v -d "`cat $1`" -X POST $2'

alias gsa='find . -type d -maxdepth 1 | xargs -I{} sh -c "echo {}; cd {}; git status | grep modified || true"'

alias ls='ls -GCF'

set -o vi

#shopt -s extglob

alias lg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

function iso_date() {
    date $@ -u +%FT%T%z 
}

eval "$(pyenv init --path)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -s "$HOME/.private.sh" ]] && source "$HOME/.private.sh"
