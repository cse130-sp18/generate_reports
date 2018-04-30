#!/bin/bash

convert -density 300 blank.pdf -pointsize 12 -draw " \
  text 100,100 'Name:' \
  text 100,120 'PID:' \
  text 100,140 'CSE 130 Account:' \
  text 100,160 'Grade:' \
" template.pdf
