# Validate header
test $(head -n 1 "$1" | awk -F, '{print NF}') -eq 53

# The rest is a bit tricky to validate. Fix it later.
