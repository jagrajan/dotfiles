# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/dotfiles/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle archlinux
antigen bundle tmux
antigen bundle colored-man-pages
antigen bundle fzf
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

alias vi="nvim"
alias copy="xclip -sel clip <"
alias copy-image="xclip -selection clipboard -t image/png -i"
alias c="clear"
alias rl="source ~/.zshrc"
alias bl="xbacklight -set"
export VISUAL=nvim
export EDITOR=nvim

export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

source ~/scripts/lib/fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
