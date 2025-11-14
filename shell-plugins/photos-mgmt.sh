EXIFTOOL_DATE_FORMAT="%Y-%m-%d_%H.%M.%S%%+3nc.%%e"
alias ets='exiftool -G -s'
alias ett='exiftool -G -s -time:all'

function rename-photos {
    exiftool \
        -fileOrder DateTimeOriginal \
        -fileOrder Filename \
        "-filename<FileModifyDate" \
        "-filename<CreationDate" \
        "-filename<DateTimeOriginal" \
        -d "$EXIFTOOL_DATE_FORMAT" \
        "$@"
}

function rename-videos {
    exiftool \
        -fileOrder Filename \
        "-filename<FileModifyDate" \
        "-filename<DateTimeOriginal" \
        -d "$EXIFTOOL_DATE_FORMAT" \
        "$@"
}

function filename-remove-prefix {
    if [[ $# -lt 2 ]]; then
        echo "Usage: <PREFIX> <FILE>..." >&2
        return 1
    fi

    prefix="$1"
    shift
    
    for f in "$@"; do
        echo "$f -> ${f#$prefix}"
        mv "$f" "${f#$prefix}"
    done
}
