#!/bin/bash

# This script will combine the csv files for each year into one file


for year in {2004..2021}
do 

echo "Processing $year"
# Add the header from January's file
head -n 1 flight_data_${year}_1.csv > flight_data_by_year/flight_data_${year}.csv

    for month in {1..12}
    do
        # Get all but the firt line of each file
        tail -n +2 flight_data_${year}_${month}.csv >> flight_data_by_year/flight_data_${year}.csv
    done

done

# Combine all the files into one

echo Combining all years into one file

# Add the header from 2004's file
head -n 1 flight_data_by_year/flight_data_2004.csv > combined_flight_data_2004-2021.csv

for year in {2004..2021}
do
  echo "Combining $year" 
  # Get all but the first line of each file
  tail -n +2 flight_data_by_year/flight_data_${year}.csv >> combined_flight_data_2004-2021.csv
done