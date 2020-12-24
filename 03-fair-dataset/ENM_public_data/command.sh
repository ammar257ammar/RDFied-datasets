#!/bin/bash

HOME_PATH=/home/apc/shared/rml

for d in $HOME_PATH/ENM_public_data/* ; do

    if [ -d "$d" ]; then

		echo "$d"

		for dd in $d/*; do

			echo "$dd"

			#rm -rf $dd/csv
			#mkdir -p $dd/csv
			rm -rf $dd/rdf
			mkdir -p $dd/rdf

			cd $dd

			rm -rf ._*_Filtered_DEG.xlsx

			for metafile in *_metadata.txt; do
			
				if [ -f *_metadata.txt ]; then
					
					echo "$metafile"
					awk 'BEGIN { FS="\t"; OFS="," } {$1=$1; print}' $metafile > metadata.csv

					\cp -f $HOME_PATH/mapping.ttl ./mapping.ttl
					\cp -f $HOME_PATH/functions.ttl ./functions.ttl

					java -Xmx2G -jar $HOME_PATH/rmlmapper-4.9.0.jar -m mapping.ttl -o rdf/data.nq  -f functions.ttl -d
				fi
			done

			for file in *_Filtered_DEG.xlsx; do	
				if [ -f *_Filtered_DEG.xlsx ]; then
					echo "$file"
					# This should be done once, because some of the sheets names should be fixed to match the contrast names
					# doing this command everytime will override the contrasts' fixed names
					#ssconvert -S $file csv/%s.csv
				fi
			done
		
			cd csv
		   
			\cp -f $HOME_PATH/functions.ttl ./functions.ttl

			rm -rf $dd/csv/rdf
			mkdir -p $dd/csv/rdf
		   
			for contrast in *.csv; do
		
				\cp -f $HOME_PATH/mapping-deg.ttl ./mapping-deg.ttl
				
				gseTemp=${dd##*/}
				GSE=${gseTemp%_files}
				
				sed -i -e "s/@CONTRAST@/${contrast%.*}/" -e "s/@GSE@/${GSE}/" mapping-deg.ttl
				
				java -Xmx2G -jar $HOME_PATH/rmlmapper-4.9.0.jar -m mapping-deg.ttl -o rdf/data-${contrast%.*}.nq  -f functions.ttl -d
		   
			done
			
		done
    fi
done

find $HOME_PATH/ENM_public_data -name data*.nq -exec cat {} + > $HOME_PATH/rdf/allData.nq
