export VIRTUAL_ENV_DISABLE_PROMPT=1

# Python environment (pyenv)
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d "$PYENV_ROOT" ]]; then
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        # Windows (pyenv-win): only needs PATH, no init commands
        export PATH="$PYENV_ROOT/pyenv-win/bin:$PYENV_ROOT/pyenv-win/shims:$PATH"
    else
        # Linux / macOS
        export PATH="$PYENV_ROOT/bin:$PATH"
        command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init --path)"
        command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
    fi
fi

# System fetch

# Directory alias

# check if `eza` is installed
if command -v eza > /dev/null 2>&1; then
    # use `eza` with icons
    alias ll="eza -lah --icons --git"
else
    # fallback to standard `ls`
    alias ll="ls -lah"
fi

# Git alias

alias gclone="git clone" # to clone a repo
alias gbranch="git branch" # to list all local branches
alias gfetch="git fetch" # to retrieve new changes on the current branch
alias gdelete="git branch -d" # to delete a local branch
alias gnew="git checkout -b" # to create a new branch from a branch
alias gcheckout="git checkout" # to checkout a local branch
alias gswitch="git switch" # to switch to a branch
alias gmerge="git merge" # to merge from a local branch
alias gpull="git pull" # to pull new changes of the current branch
alias gpush="git push" # to push new changes of the current branch

lazyg() {
    if [[ -z "$*" ]]; then
        echo "Usage: lazyg <commit message>"
        return 1
    fi
    git add . && git commit -m "$*" && git push
}


# apply custom oh-my-posh theme to the bash prompt
if command -v oh-my-posh >/dev/null 2>&1; then
    eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/hotanphat2.omp.json)"
fi

# setup zoxide on shell
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

# Run fastfetch/neofetch only in interactive shells and if not disabled
if [[ $- == *i* ]] && [[ -z "$SKIP_FETCH" ]]; then
    command -v fastfetch >/dev/null 2>&1 && fastfetch || { command -v neofetch >/dev/null 2>&1 && neofetch; }
fi
