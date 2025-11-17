DOTFILES="$HOME/.dotfiles"
DOTFILES_DEFAULT_GROUP=main

function dotfile {
    local usage
    function usage {
        echo "Usage: dotfile [list | groups | add | create | rm | rmgroup] ..." 1>&2
    }

    if [[ $# -lt 1 ]]; then
        usage
        return 1
    fi

    action="$1"
    shift

    case $action in 
        (list|ls)
            find "$DOTFILES/dotfiles" -type f -not -path "*/.git/*" -print0 | \
		        xargs -0 -n 1 realpath --relative-to "$DOTFILES/dotfiles" | \
                awk -F '/' '{ print $1 ": " gensub($1, "~", 1, $0 ) }'
            ;;
        
        (groups)
            basename -a $(find $DOTFILES/dotfiles/* -maxdepth 0 -type d)
            ;;
        
        (add)
            if [[ $# -lt 1 ]]; then
                echo "Usage: dotfile add <file> [<dotfile_group>]" >&2
                return 1
            fi
            
            # Dotfile group
            dotfile_group=$DOTFILES_DEFAULT_GROUP
            [[ $# -gt 1 ]] && dotfile_group="$2";

            if [[ ! -f "$1" ]] || [[ -h "$1" ]]; then
                echo "$1 doesn't exist, isn't a regular file or is already a symlink" 1>&2
                return 2
            fi

            target_path="$DOTFILES/dotfiles/$dotfile_group/$(realpath --relative-to="$HOME" "$1")"
            mkdir -p "$(dirname "$target_path")"
            mv "$1" "$target_path"
            ln -sr "$target_path" "$1"
            ;;
        
        (create)
            if [[ $# -lt 1 ]]; then
                echo "Usage: dotfile create <file> [<dotfile_group>]" 1>&2
                return 1
            fi
            
            touch "$1"
            dotfile add "$@"
            ;;
        
        (rm)
            if [[ $# -lt 1 ]]; then
                echo "Usage: dotfile rm <file>" 1>&2
                return 1
            fi

            if [[ $(realpath "$1") = $DOTFILES/dotfiles/* ]]; then
                rm "$(realpath "$1")"
                rm "$1"
            else
                echo "$1 isn't a symlink to a registered dotfile" >&2
                return 2
            fi
            ;;
        
        (rmgroup)
            if [[ $# -lt 1 ]]; then
                echo "Usage: dotfile rmgroup <group>" 1>&2
                return 1
            fi

            if [[ -d "$DOTFILES/dotfiles/$1" ]]; then
                rm -r "$DOTFILES/dotfiles/$1"
            else
                echo "No dotfile group '$1'" >&2
                return 2
            fi
            ;;

        (*)
            usage
            return 1
            ;;
    
    esac
}
