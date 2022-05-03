#!/usr/bin/env bash

set -o pipefail
set -u

domain=""
#search=""

usage() {
	echo -e "\nUsage:"
	echo -e "$( basename "$0" ) [-d domain]"
}

hasDns() {
	local _dns=""
	if ! _dns="$( dig +short "$1" 2>&1 > /dev/null )" ; then
		return 1
	else
		return 0
	fi
}

if (( OPTIND == 0 )); then
	echo -e "\nNo options specified."
	usage && exit 1
fi

while getopts 'd:s:' OPTION; do
  case "$OPTION" in
    d)
      domain="$OPTARG"	;;
		#r) resolvableOnly=true ;;
    ?) usage ; exit 1 ;;
  esac

done
shift "$(( OPTIND -1 ))"

[ -z "${domain}" ] && usage && exit 1;

export data certs;

if ! data="$( curl -s -f https://crt.sh/?q=%25."${domain}" | grep "<TD>" | uniq | grep "${domain}" )" ; then
	echo "Error: couldn't retrieve details for ${domain}. Exiting." >&2
fi

if [ -z "${data}" ]; then
	echo "Empty set. No results found." >&2
	exit 1
fi

# will die on a very large result
while read -r line; do 
	[ -z "${line}" ] && continue
	certs+=( "${line}" ); 
done < <( echo "${data}" | sed 's/<TD>//g' | sed 's/<\/TD>//g' | tr -d ' ' | tr '<BR>' '\n' | sort | uniq )


c=1

echo "Got ${#certs[@]} certs: "
for cert in "${certs[@]}" ; do
	echo "${c}. ${cert}"
	((c++))
done
