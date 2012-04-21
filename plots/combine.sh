#!/bin/bash

rm plots.pdf
pdftk *.pdf cat output plots.pdf
