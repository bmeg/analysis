#!/bin/bash

if [ ! -e build ]; then
  mkdir build
fi

for i in *.ipynb; do
  b=`basename $i | sed s'/.ipynb//'`
  if [ ! -e build ]; then
    mkdir build/$b
  fi
  jupyter nbconvert --to markdown ${i} --output-dir build/ # $b --output _index.md
done

touch build/_index.md
