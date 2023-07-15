#! /bin/bash

# Declare Help as a function and keep it tidy
Help (){
    # DISPLAY HELP
    echo "Enter a list of files separated by spaces."
    echo "The script will print out file sizes."
    echo "Use -h to display this help prompt"
}

# Get Options
while getopts ":h" option;
do
    case $option in
        h) 
            Help
            exit;;
    esac
done

echo "Welcome to $0 script"
echo "There are $# arguments."
# Iterate through arguments and get size for each
for file in "$@"
    do
        echo "$(du -sh $file)"
    done