# <c-v>: select file with fzf and open in vim
fzf-open-vi() {
  local dest=$(__fsel)
  if [[ ! -z "$dest" ]]; then
    LBUFFER="vi $dest"
    zle accept-line
  else
    LBUFFER=""
    zle accept-line
  fi
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

# <c-g>: open lazygit
open-lazygit() {
  LBUFFER=lazygit
  zle accept-line
}

zle     -N   open-lazygit
bindkey '^G' open-lazygit

# <m-d>: open lazydocker
open-lazydocker() {
  LBUFFER=lazydocker
  zle accept-line
}

zle     -N    open-lazydocker
bindkey '^[d' open-lazydocker

# <m-r>: open ranger
open-ranger() {
  BUFFER=ranger
  zle accept-line
}

zle     -N   open-ranger
bindkey '^[r' open-ranger

space-or-autocomplete() {
  local res=''
  # Check there are any custom configurations
  if type "env-space-or-autocomplete" > /dev/null; then
    res=$(env-space-or-autocomplete)
  fi
  # Prefer using custom configurations
  if [[ ! -z "$res" ]]; then
    BUFFER=$res
    zle accept-line
  elif [[ $BUFFER == 'pj' ]]; then
    if [[ -f package.json ]]; then
      local script=$(cat package.json | jq -r ".scripts | keys | .[]" | fzf)
      if [[ ! -z "$script" ]]; then
        LBUFFER="yarn run $script"
        zle accept-line
      else
        LBUFFER=""
        zle accept-line
      fi
    else
      zle self-insert
    fi
  elif [[ $BUFFER == 'c' ]]; then
    dest=$(ls -1a -D | fzf)
    if [[ ! -z "$dest" ]]; then
      LBUFFER="cd $dest"
      zle accept-line
    fi
    zle self-insert
  else
    zle self-insert
  fi
}

zle -N space-or-autocomplete
bindkey ' ' space-or-autocomplete
