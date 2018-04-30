#!/bin/bash

if [ -z "$1" ]; then
  echo "ERROR: file containing student data required"
  exit 1
fi

if [ -z "$2" ]; then
  echo "ERROR: log.xx file required"
  exit 1
fi

if [ -z "$3" ]; then
  echo "ERROR: assignment name (xx-name) required"
  exit 1
fi

while read -r l; do
  acc=$(awk '{print $1}' <<< $l)
  name=$(awk '{print $3" "$2}' <<< $l)
  pid=$(awk '{print $4}' <<< $l)
  grade=$(grep "$acc" "$2" | grep -o -E '[0-9]+\/[0-9]+')

  if ! [ -z "$grade" ]; then
    echo "$acc ($pid): $grade"
    convert -density 72 blank.pdf -pointsize 12 -draw " \
      text 100,100 'Name: $name' \
      text 100,120 'PID: $pid' \
      text 100,140 'CSE 130 Account: $acc' \
      text 100,160 'Grade: $grade' \
    " "${acc}-grade.pdf"
  fi
done < "$1"

convert -density 72 *-grade.pdf "${3}-grades.pdf"
rm *-grade.pdf
