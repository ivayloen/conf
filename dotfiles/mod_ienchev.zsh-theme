# ------------------------------------------------------------------------
# Modded juanghortado theme
# ienchev
# ------------------------------------------------------------------------

# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Prompt format
PROMPT='
╭─%{$GREEN%}%n@%m%{$WHITE%}: %{$BLUE_BOLD%}%~%u%{$RESET_COLOR%}
╰─➤ %{$RESET_COLOR%} '
#RPROMPT='%{$GREEN_BOLD%}$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}'
