local user='%{$fg[magenta]%}%n$fg[blue]@%{$fg[cyan]%}%m%{$reset_color%}'
local host='%{$fg[cyan]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# PROMPT="${user} ${pwd}$ "

PROMPT="$fg[magenta]${host} $fg[blue]${pwd} $fg[red] $fg[white]"
# PROMPT="$fg[magenta]${host} $fg[blue]${pwd} $fg[red] $fg[white]"
