#!/usr/bin/env bash

envroot='~/envsetting'
envs=(
    .vim
    .tmux.conf
)

grep -q LOCAL_ENV ~/.bashrc
if [ $? -eq 0 ]
then
    echo 'Warning: envsetting line alrady exist in .bashrc'
else
    # echo 'add envsetting in .bashrc'
    echo -e "LOCAL_ENV=${envroot};source \${LOCAL_ENV}/.bashrc\n" >> ~/.bashrc
fi

for env in "${envs[@]}"
do
    if [ -e ~/$env ]
    then
        echo Warning: "~/$env" already exist.
    else
        # echo $envroot/$env ~/$env
        envroot=${envroot/#\~/$HOME}
        ln -s $envroot/$env $HOME/$env
    fi
done

