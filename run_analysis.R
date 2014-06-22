#*************************************************************************************************
#                     Getting and Cleaning Data Project - - - run_analysis.R
#       You should create one R script called run_analysis.R that does the following. 
#       1.  Merges the training and the test sets to create one data set.
#       2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
#       3.  Uses descriptive activity names to name the activities in the data set
#       4.  Appropriately labels the data set with descriptive variable names. 
#       5.  Creates a second, independent tidy data set with the average of each variable for each 
#               activity and each subject. 
#*************************************************************************************************
#
#       1.  Merges the training and the test sets to create one data set.
#
#*************************************************************************************************
#   Read all datasets and tell when complete
#
cat("\nReading dataset...")
features <- read.table("features.txt", col.names=c("fid", "fname"))
activityType <- read.table("activity_labels.txt", col.names=c("aid", "aname"))
X_train <- read.table("train/X_train.txt", col.names=features$fname,check.names=FALSE)
y_train <- read.table("train/y_train.txt", col.names=c("aid"))
subject_train <- read.table("train/subject_train.txt", col.names=c("subject"))
X_test <- read.table("test/X_test.txt", col.names=features$fname,check.names=FALSE)
y_test <- read.table("test/y_test.txt", col.names=c("aid"))
subject_test <- read.table("test/subject_test.txt", col.names=c("subject"))
cat("completed.")
#
#    Merges the training and the test sets to create one dataset, then tell when complete
#
cat("\nStep 1 Merging dataset...")
xData<-rbind(X_train,X_test)
yData<-rbind(y_train,y_test)
subjectData<-rbind(subject_train,subject_test)
cat("completed.")
#
#*************************************************************************************************
#
#       2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
#
#*************************************************************************************************
#
cat("\nStep 2 Extracting mean and std...")
xSubject<-xData[,grep("-(mean|std)\\(\\)",features$fname)]
cat("completed.")
#
#*************************************************************************************************
#
#       3.  Uses descriptive activity names to name the activities in the data set
#
#*************************************************************************************************
#
cat("\nStep 3 Naming activityType...")
yData[,"aname"]<-activityType[yData[,"aid"],"aname"]
cat("completed.")
#
#*************************************************************************************************
#
#       4.  Appropriately labels the data set with descriptive variable names. 
#
#*************************************************************************************************
#
cat("\nStep 4 Labeling dataset...")
dataset<-cbind(xSubject,yData$aname,subjectData$subject)
cat("completed.")
#
#*************************************************************************************************
#
#       5.  Creates a second, independent tidy data set with the average of each variable for each 
#               activity and each subject. 
#
#*************************************************************************************************
#
cat("\nStep 5 Creating tidy dataset...")
tidy<-aggregate(xSubject,list(subject=subjectData$subject, activity=yData$aname), mean)
cat("completed.")

cat("\nWriting tidy dataset...")
write.table(tidy, "tidydata.txt", sep="\t",row.names = FALSE)

