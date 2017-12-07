PS_COLOR_White="\[\e[0;37m\]"
PS_COLOR_BYellow="\[\e[1;33m\]"
PS_COLOR_BWhite="\[\e[1;37m\]"
PS_COLOR_IBlack="\[\e[0;90m\]"
PS_COLOR_ICyan="\[\e[0;96m\]"
PS_COLOR_OFF="\[\e[0m\]"
PS1="[$PS_COLOR_BWhite\u$PS_COLOR_OFF@$PS_COLOR_White\h]"
PS1+="$PS_COLOR_IBlack(\j)"
PS1+=" $PS_COLOR_ICyan\W"
# Load in the git branch prompt script.
if [ -f ${LOCAL_ENV}/sh/git-prompt.sh ]; then
    source ${LOCAL_ENV}/sh/git-prompt.sh
    PS1+="$PS_COLOR_BYellow"'$(__git_ps1)'
fi
PS1+="$PS_COLOR_OFF \$ "

