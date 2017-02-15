#!/bin/bash

FILENAME="symlinks/.bashrc.secrets"
LPASS_NAME="Secure Notes/dotfiles/.bashrc.secrets"
cat $FILENAME | lpass edit --sync=now --non-interactive --notes "${LPASS_NAME}"
