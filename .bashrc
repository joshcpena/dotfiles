alias ls='ls --color=auto'
alias v='nvim'
alias lg="TERM=screen-256color lazygit"
alias rds='ROSETTA_DEBUGSERVER_PORT=1234'
alias tce='cd /root/indg/btas-tax-provision-tce/build/Debug/src/applications/tce-service'
eval "$(starship init bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source /root/indg/btas-tax-provision-tce/build/Debug/generators/conanbuild.sh
export NODE_COMPILE_CACHE=~/.cache/nodejs-compile-cache
