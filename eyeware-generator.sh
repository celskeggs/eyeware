#!/bin/bash

# this script sources two text files (in pwd):
# - 'text': source for words
# - 'dicenum': list of diceware numbers

for w in $(cat text); do
    echo "$w"
done > list1

# remove diacritics
cat list1 | iconv -f utf8 -t ascii//TRANSLIT > list2

# trim leading/trailing non-letters
cat list2 | sed 's/[^A-Za-z]*$//' | sed 's/^[^A-Za-z]*//' > list3

# remove words containing non-letters
cat list3 | sed "/[^A-Za-z]/d" > list4

# convert to lowercase
cat list4 | tr '[:upper:]' '[:lower:]' > list5

# limit min/max word length (in this case, min=3 max=9)
cat list5 | sed -r '/^.{,2}$/d' | sed -r '/^.{10,}$/d' > list6

# number words by frequency
cat list6 | sort | uniq -c > list7

# add leading zeros for sorting
sed -i 's/^      /000000/' list7
sed -i 's/^     /00000/' list7
sed -i 's/^    /0000/' list7
sed -i 's/^   /000/' list7
sed -i 's/^  /00/' list7
sed -i 's/^ /0/' list7

# sort list by word frequency
cat list7 | sort > list8

# get number of words to be removed
total=$(cat list8 | wc -l)
surplus=$(($total - 7776))
surplus8k=$(($total - 8192))

# reduce least-frequent words by the number found above
cat list8 | grep -v 0000001 | sed 's/.* //' > list9a
cat list8 | grep 0000001 | sed 's/.* //' | sort | head -n -$surplus > list9b
cat list8 | grep 0000001 | sed 's/.* //' | sort | head -n -$surplus8k > list9c

# compile final word lists
cat list9a list9b | sort > list9
cat list9a list9c | sort > eyeware8k

# add diceware numbering
paste dicenum list9 > eyeware-wordlist

# clean up
rm list*
