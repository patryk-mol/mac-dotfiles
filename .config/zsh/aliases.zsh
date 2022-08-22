# General
alias dotfiles='/usr/bin/git --git-dir=$HOME/projects/mac-dotfiles/ --work-tree=$HOME'
alias ls='exa -alh'
alias lsl='exa -lh'
alias maintnance='brew update %% brew upgrade'
alias open='xdg-open'
alias less='bat --paging=always'
alias cat='bat --paging=never'
alias ps='procs'
alias mkdir='mkdir -p'
alias df='df -h'
alias free='free -m'
alias ..='up'
alias ssh='run-ssh-agent; /usr/bin/ssh'
alias vim='nvim'

# Interactive mode for destructive operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'

# Navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# ssh-agent
run-ssh-agent () {
  if [ ! -S ~/.ssh/ssh_auth_sock ]; then
    eval `ssh-agent`
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
  fi
  export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
  ssh-add -l > /dev/null || ssh-add
}

