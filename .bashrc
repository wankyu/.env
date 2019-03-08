if [ -z ${LOCAL_ENV+x} ]; then
    LOCAL_ENV=~/envsetting
fi

source ${LOCAL_ENV}/sh/custom_PS1.sh
source ${LOCAL_ENV}/sh/git-completion.bash

alias mv='mv -i'
alias cp='cp -i'
alias git='LC_ALL=en_US.UTF-8 git'
alias qgit='git'

