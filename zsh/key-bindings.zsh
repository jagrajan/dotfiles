# <c-v>: select file with fzf and open in vim
fzf-open-vi() {
  LBUFFER="vi $(__fsel)"
  local ret=$?
  zle accept-line
  return $ret
}
zle     -N   fzf-open-vi
bindkey '^V' fzf-open-vi

# <c-o>: open workspaces
open-workspaces() {
  LBUFFER="cd $WORKSPACES/$(ls -1 $WORKSPACES | fzf)"
  zle accept-line
}
zle     -N   open-workspaces
bindkey '^O' open-workspaces

# <c-g>: open fugitive
open-fugitive() {
  nvim +OnlyFugitive
  zle accept-line
}

zle     -N   open-fugitive
bindkey '^G' open-fugitive
