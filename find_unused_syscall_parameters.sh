#!/bin/bash
# Alison Chaiken, alison@she-devel.com
# Offered under GPLv2+.

# Find system calls defined in "man 2" which are unwrapped, or have unused or
# unsupported parameters.   Ignore wholly unimplemented syscalls, which have
# their own man page.

# grep returns an error code when no match is found.
#set -e
set -u

readonly TLD="/usr/share/man/man2"

for FILE in "$TLD"/*gz; do
    REALPATH="$(realpath "$FILE")"
    if [[  -n "$REALPATH" ]]; then
        UNUSED="$(zgrep -i unused "${REALPATH}" | grep -v descriptor | grep -v pipe | grep -v address | grep -v unused_ | grep -v "Unused for")"
        UNSUPPORTED="$(zgrep -i unsupported "${REALPATH}")"
        UNWRAPPED="$(zgrep -i wrap "${REALPATH}" | grep  not | grep -v clone )"
        FILENAME="${REALPATH%%.2.gz}"
        if  [[ -n "$UNUSED" ]] ; then
            echo "Unused in ${FILENAME}:"
            echo "$UNUSED"
            echo
        elif [[ -n "$UNSUPPORTED" ]] ; then
            echo "Unsupported in  ${FILENAME}:"
            echo "$UNSUPPORTED"
            echo
        elif [[  -n "$UNWRAPPED" ]] ; then
            echo "Unwrapped in ${FILENAME}:"
            echo "$UNWRAPPED"
            echo
        fi
    fi
done
