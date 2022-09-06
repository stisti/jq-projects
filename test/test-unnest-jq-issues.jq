type == "object",
to_entries
| map(
    .value
    | type as $type
    | ($type == "string" or $type == "number") 
)
