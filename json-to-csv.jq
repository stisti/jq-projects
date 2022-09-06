(map(keys) | add | unique) as $cols
| map(. as $row | $cols | map($row[.] | tostring)) as $rows
| $cols, $rows[]
| @csv
