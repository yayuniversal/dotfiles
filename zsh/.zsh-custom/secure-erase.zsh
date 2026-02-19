function secure-erase {
	if [[ $# -lt 1 ]]; then
		echo "Usage: secure-erase <device>..." 1>&2
		return 1
	fi
	while (($#)); do
		sudo hdparm --user-master u --security-set-pass p $1
		sudo hdparm --security-erase p $1
		shift
	done
}

function secure-erase-enhanced {
	if [[ $# -lt 1 ]]; then
		echo "Usage: secure-erase-enhanced <device>..." 1>&2
		return 1
	fi
	while (($#)); do
		sudo hdparm --user-master u --security-set-pass p $1
		sudo hdparm --security-erase-enhanced p $1
		shift
	done
}

function sanitize-block-erase {
	if [[ $# -lt 1 ]]; then
		echo "Usage: sanitize-block-erase <device>..." 1>&2
		return 1
	fi
	while (($#)); do
		sudo hdparm --yes-i-know-what-i-am-doing --sanitize-block-erase $1
		shift
	done
}
