export WATCH_INTERVAL=0.1
export VAGRANT_DEFAULT_PROVIDER=libvirt
export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
