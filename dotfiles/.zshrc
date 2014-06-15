# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mod_ienchev"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export ALTERNATE_EDITOR="vim" EDITOR="emacsclient -n" VISUAL="emacsclient -n"

# emacs
# export EDITOR="emacsclient -t -n"
alias ec='emacsclient -n'
alias et='emacsclient -t'

alias vi='vim'
ecs() { emacsclient -n "/sudo::$*" }
ets() { emacsclient -t "/sudo::$*" }
# 
alias -g '...'='../..'
alias -g '....'='../../..'
alias matlab_clamv='sh ~/matlab.sh'

source '/opt/ros/indigo/setup.zsh'
source '/home/ienchev/ws/devel/setup.zsh'

export ROS_BOOST_LIB_DIR_NAME=/usr/lib/x86_64-linux-gnu/
export Eigen_DIR=/home/ienchev/cmake
#alias startx='startx > ~/.Xoutput'
#alias mount_storage='sudo mount -t ntfs /dev/sdb2 /media/storage'
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
