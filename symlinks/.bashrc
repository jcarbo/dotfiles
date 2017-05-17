#
# Bourne Again SHell init file.
#

# For Contactually
alias hc="heroku run rails console"
alias hl="heroku logs --tail"
alias be="bundle exec"

alias npm-exec='PATH=$(npm bin):$PATH'

# For GPG: http://unix.stackexchange.com/a/257065
export GPG_TTY=$(tty)

# Docker
# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/jeffcarbonella/.boot2docker/certs/boot2docker-vm

# Docker configuration for rosie environments
# export DOCKER_HOST=tcp://dev.enforcery.com:2376
# export DOCKER_TLS_VERIFY=1

# Do global configuration.
ARCH=`uname -s`
CONFIGDIR='/usr/operations/lib/userconfig'
if [ -f $CONFIGDIR/bash_profile-$ARCH ]; then
   . $CONFIGDIR/bash_profile-$ARCH
fi

set autolist
set filesc

# Set the PATH environment variable.
export PATH=$PATH:.

# Make the command line history ignore same sucessive entries.
# ... and commands that begin with a space.
export HISTCONTROL=ignoreboth
export HISTFILESIZE=100000

# Establish a safe environment.
set -o ignoreeof         # Do not log out with <ctrl-d>
set -o noclobber         # Do not overwrite files via '>'
alias rm="rm -i"         # Prompt before removing files via rm
alias cp="cp -i"         # Prompt before overwriting files via cp
alias mv="mv -i"         # Prompt before overwriting files via mv

# Create aliases for commonly used commands.
# alias ll="ls -laG"
alias ll="gls -l --all --color --group-directories-first --human-readable"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

PS1='\u: \W \$ '

# See: http://blog.bitfluent.com/post/27983389/git-utilities-you-cant-live-without
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  #PS1='\u: \W$(__git_ps1 "[%s]") \$ '
  PS1='\[\e[32m\]\u: \W$(__git_ps1 "[%s]") \$\[\e[m\] '
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Newer version (>=1.7.10) of git merge default enter into an interactive session. You have to add --no-edit argument
# or add environment variable GIT_MERGE_AUTOEDIT=no to suppress an interactive session
export GIT_MERGE_AUTOEDIT=no

_git_merge_pr ()
{
  # you can return anything here for the autocompletion for example all the branches
  __gitcomp_nl "$(__git_refs)"
}
