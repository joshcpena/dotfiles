eval "$(starship init zsh)"
# container brew cmd eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd --shell zsh)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Load completions
autoload -Uz compinit && compinit

# Open Buffer in nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# set default editor in nvim
export EDITOR="nvim"
export VISUAL="nvim"


zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# load fzf & zoxide
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

#PATH Vars
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:~/.cargo/env"
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="$PATH:/Users/jp133020/.local/bin"
export NODE_COMPILE_CACHE=~/.cache/nodejs-compile-cache
export PATH="$PATH:/Users/jp133020/.dotnet/tools"
export PATH="$PATH:/usr/local/netcoredbg"

export COLORTERM="truecolor" 

# cpp psql flags
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"

# Aliases 
alias dev="docker exec -it dev zsh -c 'cd /root/indg/btas-tax-provision-tce-node && /bin/zsh'"
alias v="nvim"
alias y="yazi"
#alias ls="ls --color=auto"
alias ls="eza"
alias lg="TERM=screen-256color lazygit"

alias ls='ls --color=auto'

alias ri="npm run inspect"
alias rb="npm run build"

# bun completions
[ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/root/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/root/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export PATH="$HOME/.local/bin:$PATH"
# export PATH="/Users/Shared/ggshield-1.35.0-arm64-apple-darwin:$PATH"

# fnm
FNM_PATH="/Users/jp133020/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/jp133020/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
export PATH="$HOME/.local/bin:$PATH"

alias netformatcat= "sh -c 'dotnet format --include "$1"; cat "$1"' "



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/jp133020/.opam/opam-init/init.zsh' ]] || source '/Users/jp133020/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
export PATH="/Users/Shared/ggshield-1.46.0-arm64-apple-darwin:$PATH"


## Claude code stuff
export CLAUDE_CODE_USE_BEDROCK=1 
export AWS_REGION='us-east-1'
export AWS_PROFILE='default'
# export ANTHROPIC_DEFAULT_SONNET_MODEL='us.anthropic.claude-opus-4-6'
export ANTHROPIC_DEFAULT_SONNET_MODEL='us.anthropic.claude-sonnet-4-6'

alias cr="claude --resume"
alias c="claude"
alias cs="claude --dangerously-skip-permissions"


source ~/.lcldevrc
