function pdfcompress {
	if [[ $# -lt 1 ]]; then
		echo "Usage: pdfcompress <input_file.pdf> [<output_file.pdf>]" 1>&2
		return 1
	fi

	infile="$1"
	outfile="$(basename "$1" .pdf).unlocked.pdf"
	[ $# -ge 2 ] && outfile="$2";

	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="/ebook" -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$outfile" "$infile"
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
