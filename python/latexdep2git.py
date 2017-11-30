#!/bin/python

## This is a python script to extract local files needed to complile a latex document convert a latex .dep (snapshot package) and print the git command to add those files to the repository

depfile="main.dep"

outcommand = "git add "

with open(depfile, "r") as f:
    for line in f:
        if ( ("*{file}" not in line) or ("{./" not in line) ):
            continue
        
        line=line.split();
        line=line[1];
        start= line.find("{")+1;
        end=line.find("}");

        line=line[start:end];
        
        outcommand=outcommand+" "+line;

print outcommand
