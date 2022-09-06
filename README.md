# Tiny jq project repository

These are small projects I use to learn
[jq](https://stedolan.github.io/jq/)

* [Docker image for jq](https://hub.docker.com/r/stisti/jq)
* [json-to-csv.jq](json-to-csv.jq)
* [unnest.jq](unnest.jq)
* tests for the above

## Docker image

I did not find an official Docker image and I needed one, so I made one.
Feel free to use.

## json-to-csv.jq

This is actually not written by me. I found it somewhere.

It reads flat json and produces csv. Remember to run using
`-s` and `-r` options:

```shell
jq -s -r -f json-to-csv.jq flat.json
```

## unnest.jq

I thought it would be an interesting challenge to make a version
of json-to-csv.jq that can handle nested json. Eventually
I made a separate jq program that converts nested json to flat json,
after which it can be sent to json-to-csv.jq.
It depends on the `--stream` and `-s` options.

```shell
jq --stream -s -f unnest.jq nested.json \
| jq -s -r -f json-to-csv
```

## Tests

Execute the tests running `make test`.
