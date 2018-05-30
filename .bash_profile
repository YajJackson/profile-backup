# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
test -f ~/.git-completion.bash && . $_

# Android shit
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
#export CORDOVA_ANDROID_GRADLE_DISTRIBUTION_URL=https://services.gradle.org/distributions/gradle-4.7-src.zip

#Temp directory for vim
mkdir -p /tmp/swp

# Vim things
v() {
    vim .
}

# Streamline vagrant up/ ssh process because I am incredibly lazy.
vsh() {
  vagrant up
  vagrant ssh
}

# Git things because I'm lazy
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
    grep -rnw . -e "$1"
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

# Better remove
remove() {
    rm -rf $1
}

# React native no bundle present fix
echo "alias rni=\"kill \$(lsof -t -i:8081); rm -rf ios/build/; react-native run-ios\"" >> ~/.bashrc; source ~/.bashrc

# postgres shortcut
psl() {
    psql -U postgres
}
exit() {
    read -t5 -n1 -p "Do you really wish to exit? [yN] " should_exit || should_exit=y
    case $should_exit in
        [Yy] ) builtin exit $1 ;;
        * ) printf "\n" ;;
    esac
}
wpc() {
    webpack
    cordova run ios --target="iPhone-7"
    open -a SafariPlus
}
