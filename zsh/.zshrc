export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="flazz"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM=~/.zsh-custom

plugins=(
    archlinux
    colored-man-pages
    command-not-found
    fzf
    git
    python
    sudo
    vagrant
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
