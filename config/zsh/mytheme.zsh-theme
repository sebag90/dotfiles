# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
# not rendered: ✗ (red cross) ✗
YS_VCS_PROMPT_PREFIX1="%{$fg[white]%}on%{$reset_color%}"
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✗"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}✔︎"

ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo %%; fi
}

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

local git_info='${$(git_prompt_info):+ $(git_prompt_info)}'
local virtualenv_info='$(virtualenv_prompt_info)'

# Prompt format: \n # TIME USER at MACHINE in [DIRECTORY] on git:BRANCH STATE \n $
PROMPT="${virtualenv_info}%{$fg[cyan]%}%n\
%{$fg[white]%}@\
%{$fg[green]%}$(box_name) \
%{$terminfo[bold]$fg[yellow]%}[${current_dir}]%{$reset_color%}\
%{$fg_bold[magenta]%}% \
${git_info}\
%{$terminfo[bold]$fg[white]%}%{$fg[magenta]%} $%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="\ue0a0 "
export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[red]%}("
ZSH_THEME_VIRTUALENV_SUFFIX=")%{$reset_color%} "
