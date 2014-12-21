#Getting And Cleaning Data
There is one script to be executed:
1. run_analysis.R

source data can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## 1. run_analysis.R
This script:
* assumes the required dataset is available in the working directory in a folder called 'UCI HAR Dataset'
* loads the required data from text files in the subfolder and merges these into a single data set
* extract a number of measurements required for the exercise
* transforms the data into a tidy data set and exports this as a *.txt file
