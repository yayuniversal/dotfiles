function xopen {
	if [[ $# == 0 ]]; then xdg-open .; return; fi
	for i in "$@"; do
		xdg-open $i
	done
}

function ogrep {
	local args
	while (($#)); do
		args="$args -e $1"
		shift
	done
	cat | eval grep $args
}

function cmakebuild {
	if [[ $(basename "$(pwd)") = build ]]; then
		cmake . &&
		cmake --build .
	else
		cmake -B build &&
		cmake --build build
	fi
}

function randompass {
	python3 -c "import string, random; print(''.join(random.choices(string.ascii_letters + string.digits, k=${1:-10})))"	
}

function commandsfrom {
	if [ $# -lt 1 ]; then
		echo "Usage: commandsfrom <package> [...]"
		return 1
	fi
	local regexp=$(echo "$PATH" | sed 's/:/|/g')
	dpkg -L "$@" | grep --color=never -E "$regexp" | grep -vxE "$regexp"
}

function wherefrom {
	if [ $# -lt 1 ]; then
		echo "Usage: wherefrom <command> [...]"
		return 1
	fi
	[[ -n $(/bin/which "$@") ]] || { echo "None of the supplied command where found in PATH"; return 2; }
	dpkg -S $(/bin/which "$@")
}
