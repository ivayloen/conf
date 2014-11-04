# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mod_gnzh"


. /usr/share/zsh/site-contrib/powerline.zsh
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR="vim"
export TERM="rxvt-unicode-256color"
#export ALTERNATE_EDITOR="vim" 

fpath=(/usr/share/zsh/functions $fpath)
# emacs
# export EDITOR="emacsclient -t -n"
alias ec='emacsclient -n'
alias et='emacsclient -t'

alias tmux='tmux -2'
alias td='tmux detach'

alias vi='vim'
ecs() { emacsclient -n "/sudo::$*" }
ets() { emacsclient -t "/sudo::$*" }
# 
alias -g '...'='../..'
alias -g '....'='../../..'
alias matlab_clamv='sh ~/matlab.sh'
alias catkin_make2='catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so'
alias mount_rack='sshfs ienchev.rack:/home/ienchev /home/ienchev/rack/'
alias sync_home_rack='rsync -a -r /home/ienchev/slam_ws/src ienchev.rack:~/slam_ws'
alias sync_home_azure='rsync -a -r /home/ienchev/slam_ws/src azure_vm:~/slam_ws'
alias sync_rack_home='rsync -a -r ienchev.rack:~/slam_ws/src /home/ienchev/slam_ws'
alias sync_azure_home='rsync -a -r azure_vm:~/slam_ws/src /home/ienchev/slam_ws'


source '/opt/ros/hydro/setup.zsh'
source '/home/ienchev/slam_ws/devel/setup.zsh'
#source '/home/ienchev/workspace/devel/setup.zsh'

export ROS_BOOST_LIB_DIR_NAME=/usr/lib/x86_64-linux-gnu/
export Eigen_DIR=/home/ienchev/cmake
export TEXMFHOME=/home/ienchev/publications/BIBnew/texmf
export NDKROOT=/opt/android-ndk
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
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
