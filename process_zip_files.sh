#!/bin/bash

# This script will process all the zip files in the current directory
# These files are downloaded from https://www.transtats.bts.gov/DL_SelectFields.aspx?gnoyr_VQ=FGJ&QO_fu146_anzr=b0-gvzr
# Use the prezipped file for each month.


# Make a folder for the readme if it doesn't exist
mkdir -p readme_files

# Unzip one file at a time

for file in *.zip
do
  echo "Processing $file"
  unzip $file
  
  # Extract the file date: file name looks like On_Time_Reporting_Carrier_On_Time_Performance_1987_present_2021_7.zip
  file_base=`basename $file .zip`
  file_date=${file_base##*present_}
  
  # Move all the readme.html files to have the date and put in a folder if it exists
  if [ -f readme.html ]; then
    mv readme.html readme_files/readme_$file_date.html
  fi
  
  # Rename the csv file to be shorter

  mv On_Time_Reporting_Carrier_On_Time_Performance_\(1987_present\)_$file_date.csv flight_data_$file_date.csv

done