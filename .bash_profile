# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] ⊳ "
test -f ~/.git-completion.bash && . $_
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"

#export ANDROID_HOME=~/Library/Android/sdk
#export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools:$ANDROID_HOME/platforms

export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home'
export ANDROID_HOME=/Users/jayjackson/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
export ANDROID_NDK_HOME=~/Library/Android/android-ndk-r16b/

export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/23.0.1:$PATH

export PATH="$PATH:/usr/local/var/rbenv/shims/gem"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#Temp directory for vim
mkdir -p /tmp/swp

perf() {
    gtop
}

# Vim things
v() {
    vim .
}

# Vagrant things
vsh() {
  vagrant up
  vagrant ssh
}

# Git things
gs() {
    git status
}
gl() {
  git gl
}
gai() {
  git add -i
}
gco() {
    git checkout -b $1
}
gpo() {
    git pull origin $1
}
glcear() {
    git branch | grep -v "master" | xargs git branch -D 
}
getch() {
    git fetch
}
commit() {
    git commit
}
re() {
    git checkout .
}

# misc
cls() {
  clear
}
grp() {
    grep -rnw . -e .*$1.*
}
mkcd() {
    mkdir $1
    cd $1
}

# Tmux functions
tko() {
  tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill
}
tkill() {
  tmux kill-session -t $1
}
tms() {
  tmux new -s $1
}
tma() {
  tmux a #
}
tmh() {
  echo "tms - create new tmux session"
  echo "tma - attach a tmux session to the current session"
  echo "tkill <session_name> - kill <session_name>"
  echo "tko - kill all tmux sessions"
}

# fast sourcing
vbp() {
  vim ~/.bash_profile
}
sbp() {
  source ~/.bash_profile
}
vvi() {
  vim ~/.vimrc
}
svi() {
  source ~/.vimrc
}
vgc() {
    vim ~/.gitconfig
}
sgc() {
    source ~/.gitconfig
}
vtc() {
    vim ~/.tmux.conf
}
stc() {
    source ~/.tmux.conf
}

# Better remove
remove() {
    rm -rf $1
}
copy() {
    mkdir $2
    cp -R $1 $2
}

# postgres shortcut
psl() {
    psql -U postgres
}
cPlatforms () {
    cordova platforms add ios
    cordova platforms add android
}
ckill () {
    killall Xcode
    remove platforms/
}
cbuild () {
    cordova run ios --target="iPhone-7" --buildFlag="-allowProvisioningUpdates"
    open -a Safari
}
ckb () {
    ckill
    cPlatforms
    cbuild
}
wpc() {
    webpack
    cordova run ios --target="iPhone-7" --buildFlag="-allowProvisioningUpdates"
    open -a SafariPlus
}

# Heroku shortcuts
herrors() {
    heroku logs -t -a $1 | sed -n '/PHP Fatal error/,/router/p'
}
hpsql() {
    heroku pg:psql -a $1
}
hquery() {
    heroku pg:psql -a $1 <<< $2 > $1.txt
}

hlogs () {
    heroku logs -t -a $1
}
hpush () {
    # $1 heroku remote
    # $2 branch
    git push $1 $2:master -f
}
hbash () {
    heroku run bash -a $1
}
hpgi () {
    heroku pg:info -a $1
}

cpush () {
    git add . && git commit -m "update circleci config" && git push origin ci-integration
}
