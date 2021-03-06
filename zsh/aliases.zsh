if ! type "floaterm" > /dev/null; then
  alias vi="nvim"
else
  alias vi="floaterm"
fi
alias ec="vi ~/.zshrc" # edit config
alias ea="vi ~/.aliases.zsh" # edit aliases (environment)
alias eas="vi $DF_ROOT/zsh/aliases.zsh" # edit aliases (shared)
alias nv="cd ~/.config/nvim" # open neovim config folder
alias tf="terraform"
alias dot="cd $DF_ROOT"
alias cf="cd $HOME/.config"
alias dn="cd $HOME/Downloads"
alias ws="cd ~/workspaces"
alias k="cd ~/workspaces/knowledge-base"
alias lg="lazygit"
alias ls="exa --git"
alias lm="exa --git -l --sort=modified"
alias lr="exa --git -l --sort=modified -r"
alias glgo="git log --stat --oneline"
alias w="which"
alias a="alias"
alias -g R='| rg --pretty'
alias -g L='| bat --paging=always'
alias goo="googler --count=4"
alias dc='docker-compose'
