# Invoke like:
#   jq --stream --slurp --file

# Assumes input is a $pair.
# make object key from elements by joining with dots
# ["a", "b", 0], VALUE -> {"a.b.0": VALUE}
def make_object: {
    (.[0] | map(tostring) | join(".")): .[1]
};

reduce .[] as $pair (
    # pair is an array of 2 items: key and value
    # (and key is another array of key elements)
    [{}];
    # when $pair is not a pair, stream is signaling us
    # an end of object
    if ($pair | length) == 1 and ($pair[0] | length) > 1
    # sub-object ends, don't care
    then .
    elif ($pair | length) == 1
    # top-level object ends, start collecting a new array
    then . + [{}]
    # merge with last of accumulator
    else .[-1] = .[-1] + ($pair | make_object)
    end
)
# Filter away the empty object
| map(select(. != {}))[]
