# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

#ZSH_THEME="agnoster"
ZSH_THEME="zsh2000"
#ZSH_THEME="finox"

#autoload -U promptinit; promptinit
#prompt spaceship

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git osx macports golang github golang gpg-agent npm node sbt scala xcode git-open)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#============
# 
# Color listing
if whence dircolors >/dev/null; then
  eval $(dircolors -b ~/.dir_colors)
fi

if whence gdircolors >/dev/null; then
  eval $(gdircolors -b ~/.dir_colors)
fi


# Since youre using the default colors, you can pass an empty string 
# to the list-colors to get colors in file completions.
# https://unix.stackexchange.com/questions/91937/mac-os-x-dircolors-not-found

#brew install coreutils

if whence dircolors >/dev/null; then
  export LS_COLORS
  alias ls='ls --color'
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$PATH"

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
. $LUNCHY_DIR/lunchy-completion.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh


# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/khranovsky/.netlify/helper/path.zsh.inc' ]; then source '/Users/khranovsky/.netlify/helper/path.zsh.inc'; fi

source ~/.bash_profile

export PATH="$PATH:/Users/khranovsky/Applications/development/flutter/bin"
HISTFILE=~/.histfile
HISTSIZE=30000
SAVEHIST=30000


# https://git.itoolabs.com/sandboxes/sandbox/-/blob/master/.bashrc
#
############################################################################
#                                                                          #
#               ------- Useful Docker Aliases --------                     #
#                                                                          #
#     # Installation :                                                     #
#     copy/paste these lines into your .bashrc or .zshrc file or just      #
#     type the following in your current shell to try it out:              #
#     wget -O - https://gist.githubusercontent.com/jgrodziski/9ed4a17709baad10dbcd4530b60dfcbb/raw/d84ef1741c59e7ab07fb055a70df1830584c6c18/docker-aliases.sh | bash
#                                                                          #
#     # Usage:                                                             #
#     dcu            : docker-compose up -d                                #
#     dcd            : docker-compose down                                 #
#     dex <container>: execute a bash shell inside the RUNNING <container> #
#     di <container> : docker inspect <container>                          #
#     dim            : docker images                                       #
#     dip            : IP addresses of all running containers              #
#     dl <container> : docker logs -f <container>                          #
#     dnames         : names of all running containers                     #
#     dps            : docker ps                                           #
#     dpsa           : docker ps -a                                        #
#     drmc           : remove all exited containers                        #
#     drmid          : remove all dangling images                          #
#     drun <image>   : execute a bash shell in NEW container from <image>  #
#     dsr <container>: stop then remove <container>                        #
#                                                                          #
############################################################################

function dhelp-fn {
	bold=$(tput bold)
	normal=$(tput sgr0)
	echo "${bold} dcu               ${normal}: docker-compose up -d"
	echo "${bold} dcd               ${normal}: docker-compose down"
	echo "${bold} dex <container>   ${normal}: execute a bash shell inside the RUNNING <container>"
	echo "${bold} di <container>    ${normal}: docker inspect <container>"
	echo "${bold} dim               ${normal}: docker images"
	echo "${bold} dip               ${normal}: IP addresses of all running containers"
	echo "${bold} dl <container>    ${normal}: docker logs -f <container>"
	echo "${bold} dnames            ${normal}: names of all running containers"
	echo "${bold} dps               ${normal}: docker ps"
	echo "${bold} dpsa              ${normal}: docker ps -a"
	echo "${bold} drmc              ${normal}: remove all exited containers"
	echo "${bold} drmid             ${normal}: remove all dangling images"
	echo "${bold} drun <image>      ${normal}: execute a bash shell in NEW container from <image>"
	echo "${bold} dstart <container>${normal}: start <container>"
	echo "${bold} dstop <container> ${normal}: stop <container>"
	echo "${bold} dsr <container>   ${normal}: stop then remove <container>"
}
function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip-fn {
	echo "IP addresses of all named running containers"

	for DOC in `dnames-fn`
	do
  		IP=`docker inspect $DOC | grep -m3 IPAddress | cut -d '"' -f 4 | tr -d "\n"`
  		echo $DOC : $IP
	done
}

function dex-fn {
	docker exec -it $1 ${2:-bash}
}

function di-fn {
	docker inspect $1
}

function dl-fn {
	docker logs -f $1
}

function drun-fn {
	docker run -it $1 /bin/bash
}

function dsr-fn {
	docker stop $1;docker rm $1
}

function dstop-fn {
	docker stop $1
}

function dstart-fn {
	docker start $1
}

function dim-fn {
	docker images
}

function dps-fn {
	docker ps
}

function dpsa-fn {
	docker ps -a
}

function drmc-fn {
	docker rm $(docker ps --all -q -f status=exited)
}

function drmid-fn {
	docker rmi $( docker images -q -f dangling=true)
}

alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dex=dex-fn
alias di=di-fn
alias dim=dim-fn
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps=dps-fn
alias dpsa=dpsa-fn
alias drmc=drmc-fn
alias drmid=drmid-fn
alias drun=drun-fn
alias dsr=dsr-fn
alias dstart=dstart-fn
alias dstop=dstop-fn
alias dhelp=dhelp-fn

#----------

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# -------------------
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
#autoload -Uz vcs_info
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
#zstyle ':vcs_info:git:*' formats '%b'
#--------------------

# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
#setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
#precmd () { __git_ps1 "%n" ":%~$ " "|%s" }

# In addition, if you set GIT_PS1_SHOWDIRTYSTATE to a nonempty value,
# unstaged (*) and staged (+) changes will be shown next to the branch
# name.  You can configure this per-repository with the
# bash.showDirtyState variable, which defaults to true once
# GIT_PS1_SHOWDIRTYSTATE is enabled.
#

# If you would like a colored hint about the current dirty state, set
# GIT_PS1_SHOWCOLORHINTS to a nonempty value. The colors are based on
# the colored output of "git status -sb" and are available only when
# using __git_ps1 for PROMPT_COMMAND or precmd.
set GIT_PS1_SHOWCOLORHINTS="yes"


###----~~~~~~~~~~~~``~``~~~~~~~~~`
# from https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
###-------------~~~~~~~~~~~-



## Parameters for zsh2000 Zsh theme 

#Disable the right hand side prompt entirely
#export ZSH_2000_DISABLE_RIGHT_PROMPT='true'
#Disable user@hostname
export ZSH_2000_DEFAULT_USER='YOUR_USER_NAME'
# Disable display of
# exit status of your last command
# whether or not you are root
# whether or not there are background jobs running
# by adding
export ZSH_2000_DISABLE_STATUS='true'
# Disable git status on top of plain git clean/dirty
export ZSH_2000_DISABLE_GIT_STATUS='true'
# Disable RVM prompt
export ZSH_2000_DISABLE_RVM='true'


