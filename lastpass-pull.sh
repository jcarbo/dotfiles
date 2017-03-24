#!/bin/bash

FILENAME="symlinks/.bashrc.secrets"
LPASS_NAME="Secure Notes/dotfiles/.bashrc.secrets"
lpass show "${LPASS_NAME}" &> /dev/null && lpass show --notes "${LPASS_NAME}" > $FILENAME

FILENAME="symlinks/.android/adbkey"
LPASS_NAME="Secure Notes/dotfiles/.android-adbkey"
lpass show "${LPASS_NAME}" &> /dev/null && lpass show --notes "${LPASS_NAME}" > $FILENAME

FILENAME="symlinks/.aws/credentials"
LPASS_NAME="Secure Notes/dotfiles/.aws-credentials"
lpass show "${LPASS_NAME}" &> /dev/null && lpass show --notes "${LPASS_NAME}" > $FILENAME

FILENAME="symlinks/.ngrok2/ngrok.yml"
LPASS_NAME="Secure Notes/dotfiles/.ngrok2-ngrok.yml"
lpass show "${LPASS_NAME}" &> /dev/null && lpass show --notes "${LPASS_NAME}" > $FILENAME

FILENAME="licenses.txt"
LPASS_NAME="Secure Notes/dotfiles/licenses.txt"
lpass show "${LPASS_NAME}" &> /dev/null && lpass show --notes "${LPASS_NAME}" > $FILENAME
