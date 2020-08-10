# ANSI_escape_code
COLOR_WHITE="\[\e[37m\]"
COLOR_BOLDWHITE="\[\e[1;37m\]"
COLOR_BOLDYELLOW="\[\e[1;33m\]"
COLOR_BLACK="\[\e[90m\]"
COLOR_CYAN="\[\e[96m\]"
COLOR_OFF="\[\e[0m\]"
PS1="[${COLOR_BOLDWHITE}\u${COLOR_OFF}@${COLOR_WHITE}\h]"
PS1+="${COLOR_BLACK}(\j)"
PS1+=" ${COLOR_CYAN}\W"
# Load in the git branch prompt script.
if [ -f ${LOCAL_ENV}/sh/git-prompt.sh ]; then
    source ${LOCAL_ENV}/sh/git-prompt.sh
    PS1+="${COLOR_BOLDYELLOW}"'$(__git_ps1)'
fi
PS1+="${COLOR_OFF} \$ "

