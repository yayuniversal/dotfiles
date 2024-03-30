TEMPLATE_FOLDER="$HOME/Templates"

function template {
    if [ $# -lt 1 ]; then
        echo "Usage:"
        echo -e "\ttemplate template_name [filename]"
        echo -e "\ttemplate -m template_name_1 template_name_2 ..."
        return 1
    fi

    if [ "$1" = "-m" ]; then
        shift
        while (($#)); do
            template_path="$TEMPLATE_FOLDER/$1"
            cp "$template_path" "$1"
            shift
        done
    else
        template_name="$1"
        template_path="$TEMPLATE_FOLDER/$template_name"
        shift

        if [ $# -gt 0 ]; then
            while (($#)); do
                cp "$template_path" "$1"
                shift
            done
        else
            cp "$template_path" "$template_name"
        fi
    fi
}
