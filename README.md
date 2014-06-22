Getting and Cleaning Data Project
=================================

## Overview
The objective of this project is to collect, work with and clean a dataset.   The data being used is data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## run_analysis.R Project Summary
The assignment is to create one R script called run_analysis.R that does the following: 
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Running the Script
To run the script, click on the source run_analysis.R.   As the script runs, you will see messages that tell which step of the process the script is in and when the portion has been completed.
Reading dataset...
Step 1 Merging dataset...
completed.
Step 2 Extracting mean and std...
completed.
Step 3 Naming activityType...
completed.
Step 4 Labeling dataset...
completed.
Step 5 Creating tidy dataset...
completed.
Writing tidy dataset...

### Process
1.   For both the test and train datasets, produce a tidy dataset that extracts the mean and standard deviation (see CodeBook.md)
2.   Create a second tidy dataset that extracts the average of each variable for each activity and subject.

### Tidy Dataset
The completed tidy dataset can be found at tidydata.txt


