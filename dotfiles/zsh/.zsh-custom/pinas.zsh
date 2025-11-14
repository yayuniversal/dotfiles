alias setpinasdate='ssh -A pinas sudo date -s \"$(date -R)\"'
alias naspull='syncoid --recursive --no-sync-snap --no-rollback pinas.wg:nas sandisk'
alias naspush='syncoid --recursive --no-sync-snap --no-rollback sandisk pinas.wg:nas'

function nas-zfs-snap {
    snapshot="snap_$(date +%F_%T)"
    [[ $# -ge 1 ]] && snapshot="$1"
    ssh pinas.wg sudo zfs snap -r "nas@$snapshot"
}
