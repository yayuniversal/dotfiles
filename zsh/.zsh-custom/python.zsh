# Custom venv wrapper
VENVS_LOCATION="$HOME/.local/venvs"
DEFAULT_VENV=".venv"

function lsvenv {
    ls -1 --color=never "$VENVS_LOCATION"
}

function mkvenv {
    if [[ $# -eq 0 ]]; then
        echo "Usage: mkvenv <venv_name>"
        return 1
    fi
    mkdir -p "$VENVS_LOCATION"
    for venv in "$@"; do
        virtualenv "$VENVS_LOCATION/$venv"
    done
}

function rmvenv {
    if [[ $# -eq 0 ]]; then
        echo "Usage: rmvenv <venv_name>"
        return 1
    fi
    for venv in "$@"; do
        rm -r "$VENVS_LOCATION/$venv"
    done
}

function venv {
    if [[ $# -eq 0 ]]; then
        source "$DEFAULT_VENV/bin/activate"
    elif [[ $# -eq 1 ]]; then
        if [[ -f $1/bin/activate ]]; then
            source "$1/bin/activate"
        elif [[ -f $VENVS_LOCATION/$1/bin/activate ]]; then
            source "$VENVS_LOCATION/$1/bin/activate"
        else
            echo "No venv found with name \"$1\""
            return 2
        fi
    else
        echo "Usage: venv [<venv_name>]"
        return 1
    fi
}


# Setup .pythonrc
if [[ -f "$HOME/.pythonrc" ]]; then
	export PYTHONSTARTUP="$HOME/.pythonrc"
fi
