#!/bin/bash

#files=`find . -type f -name "*.rb"`
files=`git diff-index --name-only HEAD | grep \.rb$`
for file in $files

do
 echo "Checking $file"
 ruby -c $file > /dev/null
 if [ $? -gt 0 ]; then
   echo "Error in $file"
   echo "Commit aborted"
   exit 1
 fi
done
