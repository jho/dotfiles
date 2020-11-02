#!/bin/bash

export PYENV_ROOT=/usr/local/var/pyenv
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-13.0.1.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-19.2.1/Contents/Home
export PATH=$PYENV_ROOT/shims:/opt/local/bin:/opt/local/sbin:/opt/maven/bin:~/.bin:$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:/opt/gradle/bin:/opt/play:/opt/spark/bin:/opt/graalvm/bin:$JAVA_HOME/bin:$JAVA_HOME/jre/languages/js/bin/:~/.npm-global/bin/:$HOME/.cargo/bin
export CLASSPATH=$CLASSPATH:~/.m2/repository/commons-lang/commons-lang/2.3:~/.classpath/
export MAVEN_OPTS="-Xmx1024m -Djava.awt.headless=true" #-javaagent:/opt/jrebel/jrebel.jar"
export SCALA_HOME=/opt/scala
export GRADLE_HOME=/opt/gradle
export EDITOR=/usr/bin/vi
export DISPLAY=:0.0
export PYTHONPATH=$HOME/.bin/:$PYTHONPATH
export NODE_PATH=$NODE_PATH:/user/local/lib/node_modules
#export SPARK_HOME=/opt/spark

#ODBC/Athena stuff
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export ODBCINI=/usr/local/odbc/odbc.ini
export ODBCINSTINI=/usr/local/odbc/odbcinst.ini
export SIMBA_ATHENA_ODBC_INI=/etc/simba.athenaodbc.ini

export PATH=$PATH:/usr/local/texlive/2011/bin/x86_64-darwin/

export PW_TEST_ENV=staging
export PW_TEST_LIB=/Users/jho/dev/system_test

export SBT_NATIVE_CLIENT=true

export COURSIER_REPOSITORIES="ivy2Local|central|sonatype:releases|jitpack|https://nexus.int.protectwise.net/content/repositories/releases/"

alias mvnskiptest='mvn -Dmaven.test.skip=true'

alias xmlpost='curl -H "Content-Type: text/xml" -v -d "`cat $1`" -X POST $2'

alias gsa='find . -type d -maxdepth 1 | xargs -I{} sh -c "echo {}; cd {}; git status | grep modified || true"'

alias ls='ls -GCF'

set -o vi

#shopt -s extglob

alias lg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

function ssh_emr() {
   ssh -i ~/.ssh/emr_shared.pem -t hadoop@"$@" 'bash -l; set -o vi'
}

function ssh_emr_ch() {
   ssh -i ~/.ssh/charter_emr_shared.pem hadoop@"$@"
}

function ssh_emr_bp() {
   ssh -i ~/.ssh/bp_emr_shared.pem hadoop@"$@"
}

function ssh_charter() {
   ssh -i ~/.ssh/charter.pem ubuntu@"$@"
}

function ssh_eng() {
   ssh -i ~/.ssh/eng-2.pem ubuntu@"$@"
}

function ssh_bp() {
   ssh -i ~/.ssh/bp.pem ubuntu@"$@"
}

function cemr_prod(){
  export AWS_EC2_METADATA_DISABLED=true
  CEMR_VAULT_ADDR="vault.int.protectwise.net:8200" CEMR_AUTH_CONFIG=".cemr" CEMR_AWS_REGION="us-west-2" CEMR_CONSUL_ADDR="cemr-consul.int.protectwise.net:8500" CEMR_BUCKET="pw-artifacts-us-west-2-488411906022" VASTS_AUTH_METHOD="ldap" CEMR_LOGGING="pw-cloudtrail-logs" cemr "$@"
  export AWS_EC2_METADATA_DISABLED=false
}

function cemr_bp(){
  export AWS_EC2_METADATA_DISABLED=true
  CEMR_VAULT_ADDR="vault.bp.protectwise.net:8200" CEMR_AUTH_CONFIG=".cemr-bp"  CEMR_AWS_REGION="us-east-2" CEMR_CONSUL_ADDR="cemr-consul.bp.protectwise.net:8500" CEMR_BUCKET="pw-artifacts-us-east-2-759729805950" VASTS_AUTH_METHOD="ldap" CEMR_LOGGING="pw-logs-759729805950-us-east-2" cemr "$@"
  export AWS_EC2_METADATA_DISABLED=false
}

function cemr_ch(){
  export AWS_EC2_METADATA_DISABLED=true
  CEMR_VAULT_ADDR="vault.ch.protectwise.net:8200" CEMR_AUTH_CONFIG=".cemr-ch" CEMR_AWS_REGION="us-east-1"  CEMR_CONSUL_ADDR="internal-cemr-consul-2138968492.us-east-1.elb.amazonaws.com:8500" VASTS_AUTH_METHOD="userpass" CEMR_BUCKET="pw-charter-artifacts-us-east-1"  CEMR_LOGGING="pw-charter-logs-us-east-1" cemr "$@"
  export AWS_EC2_METADATA_DISABLED=false
}

function kill_esets() {
    while :; do ps aux | grep ESET | awk '{print $2}' | sudo xargs kill -9 ; sleep 1; done
}

function iso_date() {
    date $@ -u +%FT%T%z 
}

ssh () {
  if test `find ~/.ssh/id_rsa-cert.pub -newermt '14 minutes ago'`
  then
    echo "Using cached certificate"
  else
    docker run -it -v ~/.ssh:/ssh -v ~/.vault-auth:/root/.vault-mount gitlab.int.protectwise.net:8042/engineering/infrastructure/vault-ssh-authentication/vault-auth:latest bash -c "vault-ca-ssh josh"
  fi

  /usr/bin/ssh -i ~/.ssh/id_rsa-cert.pub $@
}

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#export HTTP_PROXY=desktop.proxy.vzwcorp.com:5150
#export HTTPS_PROXY=desktop.proxy.vzwcorp.com:5150
