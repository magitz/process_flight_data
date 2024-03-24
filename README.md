# Process flight data

This repo is a set of scripts to process flight data files downloaded from the [US Bureau of Transportation Statistics](https://www.transtats.bts.gov/Homepage.asp).

They maintain a record of US commercial flight on-time performance data (which has lots of other associated information), which can be downloaded from here: [https://www.transtats.bts.gov/DL_SelectFields.aspx?gnoyr_VQ=FGJ&QO_fu146_anzr=b0-gvzr](https://www.transtats.bts.gov/DL_SelectFields.aspx?gnoyr_VQ=FGJ&QO_fu146_anzr=b0-gvzr)

Unfortunately, the data need to be downloaded month-by-month, and I don't think there's an API, so it's a manual process. But if you use the "Prezipped file" checkbox, the data download fairly quickly. (Before discovering this, I only did a couple of years at a time because it was so slow).

Once downloaded, these scripts will help you get them in a more usable formt.

* **process_zip_files.sh**: Unzips each file and moves the `readme.html` file to the `readme_files` folder and renames, adding the date. It also renames the resulting `.csv` files to `flight_data_YEAR_MO.csv`.
* **process_csv_files_by_year.sh**: Makes a combined file in the `flight_data_by_year` folder for each year (keeping only one header row). The year files tend to be about 2.5-3GB in size. The script also makes a file with all the years.
  * You will need to change the year ranges as needed for your set of yearly data.