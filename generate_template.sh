#!/bin/bash

convert -density 300 blank.pdf -pointsize 12 -draw " \
  text 300,300 'Name:' \
  text 300,360 'PID:' \
  text 300,420 'CSE 130 Account:' \
  text 300,480 'Grade:' \
" template.pdf
