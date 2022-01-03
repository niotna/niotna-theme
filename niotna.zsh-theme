#doc to edit: https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
#created by niotna
#doc here: https://github.com/niotna/niotna-theme/

#color of hooks and corners
around_color() {
	echo "%F{magenta}"
}

#path and user name color
path_and_username_color() {
	echo "%F{green}"
}

#git branch color
git_branch_color() {
	echo "%F{cyan}"
}

#display of the git branch in bold and in color
git_branch() {
	echo "%B$(git_branch_color)$(git_prompt_info)%f%b"
}

#is displayed if you are in a git repo
git_output() {
	if [[ "$(git_prompt_info)" != "" ]]
	then
		echo "- $(around_color)[%f$(git_branch)$(around_color)]"
	else
		echo "$(around_color)"
	fi
}

#display of the path in bold and in color
path_output() {
	echo "%B$(path_and_username_color)%4~%f%b "
}

#display of the current user in bold and in color
username_output() {
	echo "%B$(path_and_username_color)%n%f%b"
}

#display of the current time on the right
current_time() {
#   echo "%*"
}

#smiley separating the path and the user and in the second last character
smiley() {
	echo "❯"
}



# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# putting it all together
PROMPT='$(around_color)┌─[%f$(path_output)$(smiley) $(username_output)$(around_color)]%f $(git_output)
└─[%f$(smiley)$(around_color)]%f '
RPROMPT='$(current_time)'
