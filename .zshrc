if [ -z "$TMUX" ]; then
  if [ -n "$ALACRITTY_LOG" ]; then
    exec tmux new-session -A -s workspace
  fi
fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"
# PODMAN DOCKER FIX
#XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
#export DOCKER_SOCK=$XDG_RUNTIME_DIR/podman/podman.sock
#VIM 
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
INSERT_MODE_INDICATOR="%F{yellow}+%f"
# PATH ADD 
path+=/home/deface/.local/bin
path+=/home/deface/go/bin
path+=/home/deface/.cargo/bin
path+=/home/.poetry/bin
# SETTINGS
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status kubecontext root_indicator background_jobs history time)

export TERM="tmux-256color"
#export TERM="xterm-256color"
export EDITOR="nvim"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
# PLUG 
plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting vi-mode archlinux cp docker fzf gatsby github golang man npm kubectl kubetail)
# BIND
source $ZSH/oh-my-zsh.sh
#source /usr/share/todoist-cli/todoist_functions_fzf.sh
bindkey '^ ' autosuggest-accept
bindkey '^[[F' end-of-line
bindkey "^[OF" end-of-line
bindkey '^[[H' beginning-of-line
bindkey "^[OH" beginning-of-line
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ALIAS
alias dig="drill"
alias vim="nvim"
alias vi="nvim"
alias ls="exa -1 --classify --group-directories-first"
alias k="kubectl"
alias ka="kubectl apply"
alias kan="kubectl apply -n"
alias kd="kubectl describe"
alias kdn="kubectl describe -n"
alias kg="kubectl get"
alias kgn="kubectl get -n"
alias kn="kubectl -n"
alias kns="kubectl config set-context --current --namespace "
alias knpf="kubectl get svc --all-namespaces -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{\"\n\"}}{{end}}{{end}}{{end}}' | sort"
alias kbusy="kubectl run -i --tty busybox --image=alpine:3.17.1 --restart=Never --rm -- sh"
alias chrome="chrome --password-store=kwallet"
alias todo="todoist"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="/usr/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

bindkey -v
