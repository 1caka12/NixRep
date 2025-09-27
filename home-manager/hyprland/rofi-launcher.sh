#!/usr/bin/env bash

dir="$HOME/.config/rofi/styles"
theme='my-style-dark'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
