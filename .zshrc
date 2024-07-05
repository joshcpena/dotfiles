eval "$(starship init zsh)"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:~/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"

alias dev="docker exec -it cpp-dev-env-2 bash -c 'cd /root/indg && /bin/bash'"
alias v="nvim"
alias ls="ls --color=auto"
alias lg="lazygit"

# Created by `pipx` on 2024-07-03 22:10:31
export PATH="$PATH:/Users/jp133020/.local/bin"
