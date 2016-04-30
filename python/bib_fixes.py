#!/usr/bin/env python2
#
# This script makes some fixes to the .bib files that Mendeley can't seem to handle.
# Mainly, capitalizations of authors and article titles
# Also fix an uncapitalized author initial

import os
import re

# input/output files
ifname = 'library.bib'
ofname = 'library_fixed.bib'

# Define find between from stackoverflow.com/questions/3368969/find-string-between-two-substrings
def find_between( s, first, last ):
    try:
        start = s.index( first ) + len( first )
        end = s.index( last, start )
        return s[start:end]
    except ValueError:
        return ""

# We are looking for words that have 3 or more letters in caps
# (indicative that they are all-caps). Ignore things like III
pattern = re.compile(r'(?!ignoreme|III)\b[A-Z]{3,}\b')

# We are also looking for uncapitalized initials (single lower case character)
pattern_uncaps_initial = re.compile(r'\b[a-z]{1}\b')


# Replace all author names that are all caps, to normal
# capitalization. For example HENRY becomes Henry
lines = []
with open(ifname) as ifile:
    for line in ifile:
        
        # Clear doi variable at new bibtex entry
        if ("@" in line) :
            doiflag = False

        # Get real doi if it exists
        if ("doi=" in line.replace(' ', '') ) :
            mypatterns = ['doi=', '{', '}', ',','\n']
            doi = line.replace(' ', ''); #Strip white space
            for i in mypatterns:
                doi = doi.replace(i, "")
                
            if (doi) :
                 doiflag = True #Set doiflag to true to later modify 

            
        # Replacing all-caps words
        # We are only looking at authors or article titles
        #if ("author" in line) or ("title" in line): 
        if ("author" in line) : 
            # If the line contains an all-caps word
            if pattern.search(line) is not None:
                # split the line on all symbols and iterate through
                # each.  And replace the all-caps word by a normal
                # capitalized word.
                for l in re.compile("(\W)").split(line):
                    if pattern.match(l):
                        print('Replacing',l,'by',l.title())
                        line = re.sub(l,l.title(), line)

        # Manual fixes
        if ("Cherfils" in line):
            line = re.sub("\xcc","",line)
            line = re.sub("\x81","",line)
            line = re.sub("Clerouin","Cl\\'{e}rouin",line)


        if ("title" in line) :
            if doiflag :
#                print line
                titlearg = find_between(line, "title = {", "},")
                line = "title = {{\href{http://sci-hub.cc/"+doi+"}{\color{black}{"+titlearg+"}}}},"
           
        # # Replace uncapitalized author initials
        # if "author" in line:
        #     if pattern_uncaps_initial.search(line) is not None:
        #         print(line)

        #         # split the line on all symbols and iterate through
        #         # each.  And replace the all-caps word by a normal
        #         # capitalized word.
        #         split_line = re.compile("(\W)").split(line)
        #         for k,l in enumerate(split_line):
        #             if pattern_uncaps_initial.match(l):
        #                 print('Replacing',l,'by',l.title())
        #                 print(split_line[k])
        #                 split_line[k] = re.sub(l,l.title(), split_line[k])
        #                 print(''.join(split_line))


        lines.append(line)

# Write all this out to a new file.
with open(ofname, 'w') as ofile:
    ofile.write('This file was fixed with fixes.py\n\n')
    for line in lines:
        ofile.write(line)



