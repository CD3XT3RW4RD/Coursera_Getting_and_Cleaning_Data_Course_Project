# Getting and Cleaning Data - Course Project

This is the course project for the "Getting and Cleaning Data" Coursera course.

The attached script, `run_analysis.R`, executes the following process:

1. Download the dataset from: _https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip_
2. Extract dataset
3. Loads both the training and test datasets, and also activity dictionary and feature list
4. Determines headers from `features`, add headers for activities and subjects
5. Assembles datasets, for _x/y/subject_ parts for both `test` and `train` (backs up to file also)
6. Merges the two datasets to one dataset (backs up to file also)
7. Converts the `activityid` to `activity` for more descriptiveness
8. Replaces column names for final data set to be more descriptive
9. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.
10. Backs up final tidy data set, and displays its first portion

The end result is shown in the file `final_tidy_set.txt`.

Final dataset can be read in directly to R via the following command:

`final_tidy_set <- read.table("final_tidy_set.txt", header = T)`

then to see grouped state (as origonal output of `run_analysis.R`), call:

`final_tidy_set <- group_by(final_tidy_set,Activity,Subject)`
