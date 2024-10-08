# General
#alias git='run-ssh-agent; /usr/bin/git'
alias dotfiles='git --git-dir=$HOME/Projects/mac-dotfiles/ --work-tree=$HOME'
alias ls='eza -alh'
alias lsl='eza -lh'
alias maintnance='brew update && brew upgrade'
alias less='bat --paging=always'
alias cat='bat --paging=never'
alias ps='procs'
alias mkdir='mkdir -p'
alias df='df -h'
alias free='free -m'
alias ..='up'
alias vim='nvim'

# Interactive mode for destructive operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'

# Audio conversion
alias split-flac='shnsplit -f *.cue -t "%n. %t" -o flac *.flac'
alias split-ape='shnsplit -f *.cue -t "%n. %t" -o flac *.ape'

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
