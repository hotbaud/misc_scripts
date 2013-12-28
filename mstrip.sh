#!/bin/bash
# Program:  mstrip
# Author:   Anne Marie Merritt anne.marie.merritt@gmail.com
#
#
# This program removes the ^M character from files.
# If necessary it makes the file writable, strips
# out the ^M's from the file, then returns it to
# read-only permissions.  ^M is ascii 0xA, which is
# represented as '\r' below.  It represents the Dos
# LineFeed which the Solaris compiler and numerous
# other programs hate more than anything in the 
# Universe.
#

changed='no'

for i in $* ;
do
echo $i
# is it writable?  If so, then leave it writable.
if [ -w $i ] ; then
    cp $i mstrip_temp
    tr -d '\r' < $i > mstrip_temp
    changed='no'
else
#it's read only.  Make it writable while we alter it.
    chmod +w $i
    cp $i temp
    tr -d '\r' < $i > mstrip_temp
    changed='yes'
fi

    cp mstrip_temp $i
    if [[ $changed = "yes" ]]; then

    # if I changed the permissions to +w, change it back
    # using -w.

        chmod -w $i
    fi

    #delete mstrip_temp file.  We don't need it anymore.
    rm mstrip_temp

done
