# .bash_profile
source $HOME/.bashrc

# Stored in LP
[[ -s "$HOME/.bashrc.secrets" ]] && source "$HOME/.bashrc.secrets"

# export EDITOR="subl -w"
export EDITOR="atom -w"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
[[ -s $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion

# This loads RVM into the shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export NVM_DIR="/Users/jeffcarbonella/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# export PGHOST="/tmp"

# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# Get the aliases and functions
# if [ -f ~/.bashrc ]; then
#   . ~/.bashrc
# fi

[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  export GPG_AGENT_INFO
else
  eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info --default-cache-ttl 34560000 --max-cache-ttl 34560000 )
fi
