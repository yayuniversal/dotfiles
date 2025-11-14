function pdfcompress {
	if [[ $# -lt 1 ]]; then
		echo "Usage: pdfcompress <input_file.pdf>..." 1>&2
		return 1
	fi

	while (($#)); do
		echo "Compressing $1..."
		gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="/ebook" -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$(basename "$1" .pdf).compressed.pdf" "$1"
		shift
	done
}

function pdfunlock {
	if [[ $# -lt 1 ]]; then
		echo "Usage: pdfunlock <input_file.pdf>..." 1>&2
		return 1
	fi

	echo -n "Enter PDF password: "
	read -s password
	echo

	while (($#)); do
		echo "Unlocking $1..."
		gs -q -sPDFPassword="$password" -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$(basename "$1" .pdf).unlocked.pdf" "$1"
		shift
	done
}
