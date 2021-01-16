# Load version control information
# Load Git completion
fpath=(~/.zsh $fpath)
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'

eval "$(pyenv init -)"

# iterm2 tab title config
DISABLE_AUTO_TITLE="true"
precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
precmd

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
# PROMPT='%(?.%F{green}√.%F{red}!%?)%f %1d ${vcs_info_msg_0_} ⊳ '
PROMPT=' %1d ${vcs_info_msg_0_} ⊳ '

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


alias v='nvim .'
alias vim='nvim'
alias svh='source ~/.zshrc'
alias vvh='nvim ~/.zshrc'
alias vvc='nvim ~/.config/nvim/init.vim'
alias gs='git status'
alias gl='git gl'
alias gai='git add -i'
alias gco='git checkout -b'
alias remove='rm -rf'
alias wiki='wikit'
alias notebook='jupyter notebook'
alias ll='ls -lG'
alias copy='cp -R'
alias show='tree -L 2'
alias vconfig='vim ~/.config/nvim'

mkcd () {
    mkdir $1
    cd $1
}

codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz vcs_info
precmd() { vcs_info }

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/jayjackson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# The next line updates PATH for Google Cloud SDK
if [ -f '/Users/jayjackson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jayjackson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for glcoud
if [ -f '/Users/jayjackson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jayjackson/google-cloud-sdk/completion.zsh.inc'; fi

# removecontainers() {
#     docker stop $(docker ps -aq)
#     docker rm $(docker ps -aq)
# }
# 
# armageddon() {
#     removecontainers
#     docker network prune -f
#     docker rmi -f $(docker images --filter dangling=true -qa)
#     docker volume rm $(docker volume ls --filter dangling=true -q)
#     docker rmi -f $(docker images -qa)
# }
source ~/.iterm2_shell_integration.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

