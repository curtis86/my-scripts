#!/usr/bin/env bash

set -o pipefail
set -u

[ $# -ne 1 ] && { echo "Usage: cert-check <domain-name>" >&2; exit 1 ;}

domain=$1

[ -z "$( dig +short "${domain}" )" ] && { echo "Error: no DNS/domain found." >&2 ; exit 1 ;}

if ! certOutput="$( openssl s_client -servername "${domain}" -connect "${domain}":443 <<< "Q"  2>&1 )" ; then
	echo -e "\nError: unable to get SSL info." >&2 ; exit 1
fi

echo "${certOutput}" | openssl x509 -noout -text | less
