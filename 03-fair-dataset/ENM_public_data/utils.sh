
# Delete all files and folders starting with "._" which they are junk files
find . -type f -name \\._* -exec rm {} \;

# Delete all files for unfiltered genes
find . -type f -name *Unfiltered_DEG.xlsx -exec rm {} \;
