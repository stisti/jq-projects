#!/bin/bash
image="stisti/jq:1.6"
if tty -s; then
    # our stdin is a tty, which means we are not reading from file
    # -> last parameter must be a file
    f="${!#}"
    if test -f "$f"; then
        # remove last param
        set -- "${@:1:$(($#-1))}"
        if [[ "${f:0:1}" != "/" ]]; then
            f="$PWD/$f"
        fi
        exec docker run --rm --init --network=none -v "$f:$f:ro" -w / "$image" "$@" "$f"
    fi
    # and if it wasn't, we fall through to the non-bind-mounting case
fi
exec docker run -i --rm --init --network=none "$image" "$@"
