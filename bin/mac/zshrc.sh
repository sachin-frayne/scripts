#!/usr/bin/env bash

tee ~/.zshrc <<-'EOF' >/dev/null
ZSH_THEME=""

HISTFILE=~/.zsh_history
HISTSIZE=9999999
SAVEHIST=9999999

setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

(cd ~/.zsh/custom/plugins/zsh-syntax-highlighting && git pull)
(cd ~/.zsh/custom/plugins/zsh-autosuggestions && git pull)
(cd ~/.zsh/custom/plugins/powerlevel10k && git pull)

source ~/.zsh/custom/plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz compinit
autoload -Uz compaudit
compaudit | xargs chmod g-w
compinit
source <(kubectl completion zsh)

POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_CUSTOM_PROMPT_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_PROMPT_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_PROMPT="echo $"
POWERLEVEL9K_DIR_FOREGROUND="white"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs custom_prompt)
POWERLEVEL9K_OS_ICON_FOREGROUND="green"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=green,green
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,green
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=green,green
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=green,green
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=green,green
ZSH_HIGHLIGHT_STYLES[globbing]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=red,bold

unalias -a

alias c='clear'
alias clear='printf "\033c"'
alias cp='cp -iv'
alias docker_start='open -a Docker'
alias docker_stop='pkill -SIGHUP -f /Applications/Docker.app "docker serve"'
alias finder='open .'
alias grep='grep --color=auto'
alias history='history -in'
alias k=kubectl
alias ll='ls -lah'
alias ls='ls -G'
alias mac='~/Documents/scripts/mac.sh'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias reset_coreaudio='sudo killall coreaudiod'
alias tailf='tail -f'
alias tunnel_reset='sudo ifconfig en1 down; sudo route flush; sudo ifconfig en1 up'

EOF
