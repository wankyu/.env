if [ -z ${LOCAL_ENV+x} ]; then
    LOCAL_ENV=~/.env
fi

source ${LOCAL_ENV}/sh/custom_PS1.sh
source ${LOCAL_ENV}/sh/git-completion.bash # required git version > 2.*

alias ll='ls -al'
alias mv='mv -i'
alias cp='cp -i'
alias git='LC_ALL=en_US.UTF-8 git'
alias qgit='git'
alias dev='tmux a'

alias urlencode="python -c 'import sys,urllib;print urllib.quote(sys.stdin.read().strip())'"

