#!/bin/bash

FILENAME="symlinks/.bashrc.secrets"
LPASS_NAME="Secure Notes/dotfiles/.bashrc.secrets"
cat $FILENAME | lpass edit --non-interactive --notes "${LPASS_NAME}"

FILENAME="symlinks/.android/adbkey"
LPASS_NAME="Secure Notes/dotfiles/.android-adbkey"
cat $FILENAME | lpass edit --non-interactive --notes "${LPASS_NAME}"

FILENAME="symlinks/.aws/credentials"
LPASS_NAME="Secure Notes/dotfiles/.aws-credentials"
cat $FILENAME | lpass edit --non-interactive --notes "${LPASS_NAME}"

lpass sync
