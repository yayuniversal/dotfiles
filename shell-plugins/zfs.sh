function zfs-recurse-rollback {
    if [[ $# -ne 2 ]]; then
        echo "Usage: zfs-recurse-rollback <dataset> <snapshot>" 1>&2
        return 1
    fi
    dataset="$1"
    snapshot="$2"

    zfs list -rH -t filesystem -o name "$dataset" | xargs -I _ sudo zfs rollback -r "_@$snapshot"
}

function zfs-autosnap-destroy {
    zfs list -H -o name -t snapshot -S creation "$@" | grep "@autosnap_" | xargs -n 1 sudo zfs destroy -v
}
