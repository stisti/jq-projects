.DELETE_ON_ERROR:

JQ = jq
TEST_INPUT = jq-issues.jsonl

test: .test.unnest .test.group

.test.group: .out.group.json
	$(JQ) -e '(type == "object"), (to_entries | map(.value | type == "array") | all)' $<

.out.group.json: group.jq .out.unnest.json
	$(JQ) -s -f $^ > $@

.test.unnest: .out.unnest.json
	$(JQ) -e -s '(map(type == "object") | all), (map(length == 1) | all)' $<

.out.unnest.json: unnest.jq $(TEST_INPUT)
	$(JQ) -c --stream -f $^ > $@

clean:
	$(RM) .out.* .test.*
