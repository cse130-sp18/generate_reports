#!/bin/bash

while read -r l; do
  acc=$(awk '{print $1}' <<< $l)
  name=$(awk '{print $3" "$2}' <<< $l)
  pid=$(awk '{print $4}' <<< $l)
  grade=$(grep "$acc" log.00 | grep -o -E '[0-9]+\/[0-9]+')

  if ! [ -z "$grade" ]; then
    echo "$acc ($pid): $grade"
    convert -density 72 blank.pdf -pointsize 12 -draw " \
      text 100,100 'Name: $name' \
      text 100,120 'PID: $pid' \
      text 100,140 'CSE 130 Account: $acc' \
      text 100,160 'Grade: $grade' \
    " "${acc}-grade.pdf"
  fi
done < students

convert -density 72 *-grade.pdf 00-lambda-grades.pdf
rm *-grade.pdf
