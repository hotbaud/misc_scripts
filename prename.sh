#!/bin/bash
# Program:  prename.sh
# Author:   Anne Marie Merritt
#
# Prepends a group of files with the given prefix. If you're
# not sure what you're doing, work on copies first, before
# renaming a whole directory or album of files.
#
# I use then when I get a bunch of songs helpfully named
# things like 1.mpg, 2.mpg, etc. At least I can rename 
# them with the album name as a prefix so I can tell where
# they came from when I import them to iTunes or some other 
# place.
#
# e.g. > ./testrename "fo*" "bar_"
# renames foo.mpg to bar_foo.mpg .
#

prefix=$2

for i in $1 ;
do
	echo "starting with:  " $i
	mfile=$(echo $i | sed 's/\.\///')
	echo $mfile
	echo "finalname:" $prefix$mfile
	mv "$mfile" "$prefix$mfile"

done
