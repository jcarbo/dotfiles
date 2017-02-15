#!/bin/bash

FILENAME="symlinks/.bashrc.secrets"
LPASS_NAME="Secure Notes/dotfiles/.bashrc.secrets"
lpass show "${LPASS_NAME}" &> /dev/null && lpass show --notes "${LPASS_NAME}" > $FILENAME
