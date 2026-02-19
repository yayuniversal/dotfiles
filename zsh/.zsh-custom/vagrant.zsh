alias vprw='vpr --provision-with'
alias vrpw='vrp --provision-with'
alias vsshc-export='vagrant-export-ssh-config'

function vagrant-export-ssh-config {
    filename="$(basename "$PWD")"
    filepath="$HOME/.ssh/config.d/vagrant.d/$filename"
    mkdir -p -m 700 ~/.ssh/config.d/vagrant.d
    vagrant ssh-config > "$filepath"
    chmod 600 "$filepath"
}
