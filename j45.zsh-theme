#FILE LOCATION: ~/.oh-my-zsh/themes/j45.zsh-theme
if [[ "${USER_ALIAS}" == "" ]]; then
	USER_ALIAS=${USER}
fi

function theme_precmd {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))


    ###
    # Truncate the path if it's too long.

    PR_PWDLEN=""

    if [[ "${USER_ALIAS}" == "" ]]; then
      	USER_ALIAS=${USER}
    fi

    if [[ "${USER_ALIAS_LENGTH}" == "" ]]; then
		USER_ALIAS_LENGTH=${#${USER_ALIAS}}
    fi

    local promptsize=${#${(%):-------[@%m:%l)---()--}}
    local pwdsize=${#${(%):-%~}}

    if [[ "${promptsize} + ${pwdsize}" -gt ${TERMWIDTH} ]]; then
      ((PR_PWDLEN=${TERMWIDTH} - ${promptsize}))
   fi

}

setprompt () {
    ###
    # Need this so the prompt will work.

    setopt prompt_subst

    ###
    # See if we can use colors.

    PR_NO_COLOUR="%{${terminfo[sgr0]}%}"

	PR_CHAR='>'

    ###
    # Finally, the prompt.

    PROMPT='[ ${USER}@${HOST} \
%${PR_PWDLEN}<...<%~%<< ] \

${PR_CHAR} '

    # display exitcode on the right when >0
    return_code="%(?..%{${fg[red]}%}%? ⮐%{${reset_color}%})"
    RPROMPT=' ${return_code}'
}

setprompt

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

ZSH_AUTOSUGGEST_STRATEGY=(completion)
fortune | cowsay | lolcat -S 23
echo
neofetch
