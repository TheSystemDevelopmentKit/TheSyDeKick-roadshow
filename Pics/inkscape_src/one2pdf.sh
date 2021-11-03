#!/usr/bin/env bash

echo "Converting $1 ..."
inkscape -A ../${1%.*}.pdf --export-ignore-filters --export-pdf-version=1.5 $1

echo "Done."
