DF_ROOT="$HOME/dotfiles"

alias rl='source $HOME/.zshrc'

# Check for any environemnt specific variables
[[ ! -f "$HOME/.env.zsh" ]] || source $HOME/.env.zsh

# Prefer python3 as default
if [[ -f "/usr/local/bin/python3" ]]; then
  alias python="/usr/local/bin/python3"
fi

# Set up reading file to clipboard
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias copy="pbcopy <"
else
  alias copy="xclip -sel clip <"
fi

# Install antigen if we not installed
if [[ ! -f $DF_ROOT/antigen.zsh ]]; then
  curl -L git.io/antigen > $DF_ROOT/antigen.zsh
fi

# ls automatically when changing directories
cd() { builtin cd "$@" && ls --color=tty; }

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

source $DF_ROOT/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle tmux
antigen bundle colored-man-pages
antigen bundle fzf
antigen bundle command-not-found
antigen bundle yarn
antigen bundle terraform

if [[ -f /etc/arch-release ]]; then
  antigen bundle archlinux
fi

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

alias bl="xbacklight -set"
export VISUAL=nvim
export EDITOR='urxvt -i -e nvim'

export FZF_DEFAULT_COMMAND='fd -L'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Prompt w/ git info
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr 'M'
zstyle ':vcs_info:*' unstagedstr 'M'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
  [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
    hook_com[unstaged]+='%F{1}??%f'
  fi
}
precmd () { vcs_info }
PROMPT='%F{99}%3~ ${vcs_info_msg_0_} %f> '

if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

[[ ! -f "$DF_ROOT/zsh/aliases.zsh" ]] || source $DF_ROOT/zsh/aliases.zsh
[[ ! -f "$DF_ROOT/zsh/key-bindings.zsh" ]] || source $DF_ROOT/zsh/key-bindings.zsh
[[ ! -f "$HOME/.aliases.zsh" ]] || source $HOME/.aliases.zsh

export NVM_DIR=~/.nvm

if [[ "$OSTYPE" == "darwin"* ]]; then
  # source /usr/local/opt/nvm/nvm.sh
fi

# Load sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

autoload -U +X bashcompinit && bashcompinit
[[ -s /usr/local/bin/terraform ]] && complete -o nospace -C /usr/local/bin/terraform terraform
