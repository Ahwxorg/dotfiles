# local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'

# PROMPT="[$fg[red]a$fg[orange]h$fg[yellow]w$fg[green]x$fg[cyan]@$fg[blue]h$fg[purple]a$fg[red]i$fg[orange]l ${pwd}]$ "
PROMPT="$fg[blue]${pwd} $fg[red] "
