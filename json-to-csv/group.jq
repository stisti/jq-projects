map(to_entries[0])
| reduce .[] as $i (
    {};
    . + {
        ($i.key): ( .[$i.key] + [$i.value] )
    }
)
