#!/bin/bash
echo "##[group]Archive old builds"
echo "##[debug] Archive old builds script started"
# WORKING DIRECTORY IS $(Agent.WorkFolder)/wiki/${{ parameters.wikiDirectory }}
bn=$BUILD_DEFINITIONNAME
build_name=${bn// /_}

# CD INTO THE build_name DIRECTORY
cd "Builds/$build_name"

# CREATE THE Archives DIRECTORY IF IT DOESN'T EXIST 
mkdir -p "Archives"

# FIND ALL FILES IN THE CURRENT WORKING DIRECTORY | 
#   REVERSE SORT | 
#   GET ALL BUT THE LATEST 10 FILES |
#   MOVE THEM TO THE Archives FOLDER
find * -maxdepth 0 -type f | sort -nr | awk 'NR > 10' | xargs -i mv {} ./Archives/
echo "##[debug] find and move old builds to ./Archives/ done"
echo "##[endgroup]"