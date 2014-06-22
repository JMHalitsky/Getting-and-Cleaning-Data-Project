# Code Book - Getting and Cleaning Data Project

## Overview
The objective of this project is to collect, work with and clean a dataset.   The data being used is 
data collected from the accelerometers from the Samsung Galaxy S smartphone. 

## Dataset Information
A full description is available at the site where the data was obtained: 
        ...http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The source data for the project: 
        ...https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
### Quick Overview
..*  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
..*  Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
..*  Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz.
..*  The obtained dataset has been randomly partitioned into two sets, where 70'%' of the volunteers was selected 
for generating the training data and 30'%' the test data. 

..*  For each record it is provided:
..- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
..- Triaxial Angular velocity from the gyroscope. 
..- A 561-feature vector with time and frequency domain variables. 
..- Its activity label. 
..- An identifier of the subject who carried out the experiment.

## Section 1.  Merges the training and the test sets to create one data set.
Read in all the source files
..-  features.txt               
..-  activity_labels.txt
..-  train/X_train.txt
..-  train/y_train.txt
..-  train/subject_train.txt
..-  test/X_test.txt
..-  test/y_test.txt
..-  test/subject_test.txt

Merge these datasets to create 1 dataset
..1.  Combine the x train and test data into 1 dataset
..*   xData<-rbind(X_train,X_test)              
..2.  Combine the y train and test data into 1 dataset
..*   yData<-rbind(y_train,y_test)
..3.  Combine the x and y datasets into 1 dataset
..*   subjectData<-rbind(subject_train,subject_test)

## Section 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
..1.  Extracts the mean and standard deviation of the combined x train and test dataset using featured data 
..*   xSubject<-xData[,grep("-(mean|std)\\(\\)",features$fname)]

### Extracted Feature Fields
tBodyAccJerk-std( )-X
tBodyAccJerk-mean( )-Z
tBodyAccJerk-mean( )-Y
tBodyAccJerk-mean( )-X
tBodyAcc-std( )-Z
tBodyAcc-std( )-Y
tBodyAcc-std( )-X
tBodyAcc-mean( )-Z
tBodyAcc-mean( )-Y
tBodyAcc-mean( )-X
fBodyGyroMag-std( )
fBodyGyroMag-mean( )
fBodyGyroJerkMag-std( )
fBodyGyroJerkMag-mean( )
fBodyGyro-std( )-Z
fBodyGyro-std( )-Y
fBodyGyro-std( )-X
fBodyGyro-mean( )-Z
fBodyGyro-mean( )-Y
fBodyGyro-mean( )-X
fBodyAccMag-std( )
fBodyAccMag-mean( )
fBodyAccJerkMag-std( )
fBodyAccJerkMag-mean( )
fBodyAccJerk-std( )-Z
fBodyAccJerk-std( )-Y
fBodyAccJerk-std( )-X
fBodyAccJerk-mean( )-Z
fBodyAccJerk-mean( )-Y
fBodyAccJerk-mean( )-X
fBodyAcc-std( )-Z
fBodyAcc-std( )-Y
fBodyAcc-std( )-X
fBodyAcc-mean( )-Z
fBodyAcc-mean( )-Y
fBodyAcc-mean( )-X

## Section 3.  Uses descriptive activity names to name the activities in the data set
..1.  Adds the activityType dataset to the combined dataset of the y train and test data.
..*   yData[,"aname"]<-activityType[yData[,"aid"],"aname"]

## Section 4.  Appropriately labels the data set with descriptive variable names. 
..1.  Labels the column's in the dataset with the activty names from section 3. 
..*   dataset<-cbind(xSubject,yData$aname,subjectData$subject)

## Section 5.  Creates a second, independent tidy data set with the average of each variable for each 
activity and each subject. 
..1.  Using the above data, creates a new dataset that takes the average of each of the activites and subjects.
..*   tidy<-aggregate(xSubject,list(subject=subjectData$subject, activity=yData$aname), mean)
..2.  Writes the new data to a .txt file
..*   write.table(tidy, "tidydata.txt", sep="\t",row.names = FALSE)
