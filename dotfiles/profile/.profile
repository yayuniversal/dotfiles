export WATCH_INTERVAL=0.1
export VAGRANT_DEFAULT_PROVIDER=libvirt
export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)
export EDITOR=nvim

if [ -z "$SSH_CONNECTION" ]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
