# Get OS name
os_name() {
  case "$(uname)" in
    "Darwin") echo "mac";;
    "Linux") echo "linux";;
    *) echo "unknown";;
  esac
}

# Main prompt
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )"
PROMPT+=' %{$fg[yellow]%}$(os_name)%{$reset_color%}'  # Add OS name
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%}'  # Current directory
PROMPT+=' $(git_prompt_info)'

# Git prompt styling (unchanged)
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
