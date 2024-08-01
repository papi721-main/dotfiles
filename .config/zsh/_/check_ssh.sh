#!/usr/bin/bash
if [ $(pgrep -c ssh-agent) == 0 ]; then
    eval "$(ssh-agent)" >/dev/null 2>&1
fi

ssh-add ~/.ssh/id_github >/dev/null 2>&1
