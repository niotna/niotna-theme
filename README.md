# zsh-theme
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

## install

oh my zsh theme. mix duellj with git branch

```BASH
git clone --depth 1 --no-checkout git@github.com:niotna/niotna-theme.git && mv niotna-theme/niotna.zsh-theme ~/.oh-my-zsh/themes/niotna-theme && rm -rf niotna.zsh-theme && sed -i 's/ZSH_THEME="[^\"]*"/ZSH_THEME="niotna"/' ~/.zshrc && source ~/.zshrc
```

## Exemple

this theme displays the current folder path, the current user and the current git branch if we are in a git repository

the theme looks like this when we are in a git repository

![git repo](https://github.com/antoinechab/zsh-theme/blob/main/images/them-with-git.png)

the theme looks like this when we are not in a git repository

![not a git repo](https://github.com/antoinechab/zsh-theme/blob/main/images/theme-without-git.png)

## update

you can simply update these functions to change the colors wherever they appear
```bash
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
```

to update colors types one of this:

```bash
# to change color of hooks and corners
sed -i '/around_color() {/!b;n;c\	echo "%F{TO_CHANGE_BY_YOUR_NEW_COLOR}"' ~/.oh-my-zsh/themes/niotna.zsh-theme

# to change color of path and user name color
sed -i '/path_and_username_color() {/!b;n;c\	echo "%F{TO_CHANGE_BY_YOUR_NEW_COLOR}"' ~/.oh-my-zsh/themes/niotna.zsh-theme

# to change color of git branch
sed -i '/git_branch_color() {/!b;n;c\	echo "%F{TO_CHANGE_BY_YOUR_NEW_COLOR}"' ~/.oh-my-zsh/themes/niotna.zsh-theme
```

to change the information displayed in square brackets, simply update the following methods
```bash
┌─[1 ❯ 2] - [3]
```

1:
```bash
#display of the path in bold and in color
path_output() {
	echo "%B$(path_and_username_color)%4~%f%b "
}
```

2:
```bash
#display of the current user in bold and in color
username_output() {
	echo "%B$(path_and_username_color)%n%f%b"
}
```
3:
```bash
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
```

and finally to change the time on the left by something else, you can update this function

```bash
#display of the current time on the right
current_time() {
   echo "%*"
}
```

to stop seeing the time on the right type this command 

```bash
sed -i '/echo "%*"/s/^/# /' ~/.oh-my-zsh/themes/niotna.zsh-theme
```
and this one to see again:

```bash
sed -i '/echo "%*"/s/^# //' ~/.oh-my-zsh/themes/niotna.zsh-theme
```
## edit

to display other elements instead of the current path, type :

```bash
sed -i 's|echo "%B$(path_and_username_color)%4~%f%b "|echo "%B$(nouveau_chemin)%4~%f%b "|' ~/.oh-my-zsh/themes/niotna.zsh-theme
```

to display something else instead of the current user:

```bash
sed -i 's|echo "%B$(path_and_username_color)%n%f%b"|echo "%B$(nouvel_utilisateur)%n%f%b"|' ~/.oh-my-zsh/themes/niotna.zsh-theme
```
