function zfs-recurse-rollback {
    parent_dataset=$(echo "$1" | cut -f1 -d@ -s)
    snapshot=$(echo "$1" | cut -f2 -d@ -s)

    if [[ $# -ne 1 || -z $parent_dataset || -z $snapshot ]]; then
        echo "Usage: zfs-recurse-rollback dataset@snapshot" 1>&2
        return 1
    fi

    for dataset in $(zfs list -rH -t filesystem -o name "$parent_dataset"); do
        sudo zfs rollback -r "${dataset}@${snapshot}"
    done
}

function zfs-autosnap-destroy {
    zfs list -H -o name -t snapshot -S creation "$@" | grep "@autosnap_" | xargs -n 1 sudo zfs destroy -v
}
