#-------------------
# Modules
#-------------------
autoload -Uz vcs_info
autoload -Uz zmv
autoload -Uz compinit

#-------------------
# General
#-------------------
setopt auto_pushd
setopt auto_cd
setopt extended_glob
setopt correct
setopt auto_resume
setopt magic_equal_subst
setopt no_no_match
setopt ignore_eof
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt pushd_ignore_dups
setopt no_flow_control

#------------------
# Zplug
#------------------
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
if ! zplug check; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

#-------------------
# Variables
#-------------------
export VISUAL='vim'
export PATH=~/.nimble/bin:$PATH
PROMPT='%F{1}@%f%F{3}%n%f%F{5}{%f%F{6}%#%f%F{5}}%f%F{4}-%f%F{2}>%f '
RPROMPT='[%~]'
KEYTIMEOUT=1
