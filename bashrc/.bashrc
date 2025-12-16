export VIRTUAL_ENV_DISABLE_PROMPT=1

# :::: directory alias ::::

# check if `eza` is installed
if command -v eza > /dev/null 2>&1; then
    # use `eza` with icons
    alias ll="eza -lah --icons"
else
    # fallback to standard `ls`
    alias ll="ls -lah"
fi

# :::: git alias ::::

alias gclone="git clone $@" # to clone a repo
alias gbranch="git branch" # to list all local branches
alias gfetch="git fetch" # to retrieve new changes on the current branch
alias gdelete="git branch -d $@" # to delete a local branch
alias gnew="git checkout -b $@ $@" # to create a new branch from a branch
alias gcheckout="git checkout $@" # to checkout a local branch
alias gmerge="git merge $@" # to merge from a local branch
alias gpull="git pull" # to pull new changes of the current branch
alias gpush="git push" # to push new changes of the current branch

lazyg() {
    git add . && \
    git commit -m "$*" && \
    git push
}

# :::: wsl alias ::::

alias wsll="wsl -l -v" # to show all wsl local verbose
alias wsllo="wsl -l -o" # to show all wsl online verbose

# apply custom oh-my-posh theme to the bash prompt
eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/hotanphat2.omp.json)"

# setup zoxide on shell
eval "$(zoxide init bash)"
