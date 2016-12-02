## ReadMe for John Hopkins Data Science Coursera track - Course 3
### The Course Project

This is for the course project assignment for Course 3 (Getting and Cleaning Data) of the John Hopkins Data Science Coursera track.

The run_analysis.R script will take the data provided in the project and will create a text file containing a tidier version of the data. This script assumes the dplyr and reshape2 libraries are installed. It also assumes the script is located in the original working directory of the provided data (the home directory containing the test and train folders).

When the run_analysis function in the script is run, the data will be imported into R, one file at a time. All the data will then be merged and cleaned up. A second data frame will be created, which contains the merged data grouped by subject and activity. The columns containing all the measurements will each be averaged and then melted together in one column. Finally, this data frame will be outputted to a text file called "dataset.R".
