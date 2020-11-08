# <c-v>: select file with fzf and open in vim
fzf-open-vi() {
  LBUFFER="vi $(__fsel)"
  local ret=$?
  zle accept-line
  return $ret
}
zle     -N   fzf-open-vi
bindkey '^V' fzf-open-vi
