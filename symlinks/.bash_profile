# .bash_profile
source $HOME/.bashrc

# Stored in LP
[[ -s "$HOME/.bashrc.secrets" ]] && source "$HOME/.bashrc.secrets"

# export EDITOR="subl -w"
# export EDITOR="atom-beta -w"
# export EDITOR="atom -w"
export EDITOR="code -w"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
[[ -s $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion

export NVM_DIR="$HOME/.nvm"
[[ -s $(brew --prefix)/opt/nvm/nvm.sh ]] && source $(brew --prefix)/opt/nvm/nvm.sh

export ANDROID_HOME=$(brew --prefix)/share/android-sdk

# [ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
# if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#   export GPG_AGENT_INFO
# else
#   eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info --default-cache-ttl 34560000 --max-cache-ttl 34560000 )
# fi

# Needed to install rmagick gem
export PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig

# This loads RVM into the shell session (needs to be at EOF)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
