# Validate it is an object
type == "object",

# Validate all values are of type string, number, boolean or null
# or empty arrays
(
    to_entries
    | map(
        .value
        | type as $type
        | (
            $type == "string" or
            $type == "number" or
            $type == "boolean" or
            $type == "null" or 
            $type == "array"
        )
    )
    | all
),

# Validate all arrays that are there are empty arrays
(
    to_entries
    | map(select(.value | (type == "array")))
    | map(.value == [])
    | all
)
