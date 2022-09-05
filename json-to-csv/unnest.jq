#!/usr/bin/jq -f
{
    (.[0] | join(".")): (.[1])
}
