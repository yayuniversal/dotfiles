export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="flazz"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM=~/.zsh-custom

plugins=(
    archlinux
    colored-man-pages
    command-not-found
    docker
    docker-compose
    fzf
    git
    gitignore
    glab
    kubectl
    opentofu
    python
    scw
    sudo
    terraform
    vagrant
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
