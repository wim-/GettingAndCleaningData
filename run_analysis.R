## Getting and Cleaning Data - course project
## by: github.com/wim-
## This script: 
##     1) Merges the training and the test sets to create one data set.
##     2) Extracts only the measurements on the mean and standard deviation
##        for each measurement. 
##     3) Uses descriptive activity names to name the activities in the data set
##     4) Appropriately labels the data set with descriptive variable names. 
##     5) From the data set in step 4, creates a second,
##        independent tidy data set with the average of each variable
##        for each activity and each subject.
## nota bene:
##     downloading the data was not a part of the assignment
##     the script below assumes the data is contained in a 'UCI HAR Dataset' subfolder
##     this subfolder should be located in the working directory

##############################################
## step 1: get data                         ##
##############################################

## read train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

## combine train and test data
subject_ids <- rbind(subject_train,subject_test)
colnames(subject_ids) <- c("subject_id")
measurements <- rbind(x_train,x_test)
label_ids <- rbind(y_train,y_test)
colnames(label_ids) <- c("activity")
rm (subject_train,x_train,y_train,subject_test,x_test,y_test)

## apply proper variable names to measurements
features <- read.table("UCI HAR Dataset/features.txt")
colnames(measurements) <- features$V2
rm(features)

## combine everything in a single data set
data <- cbind(subject_ids,label_ids,measurements)
rm (subject_ids,label_ids,measurements)

##############################################
## step 2: extract required measurements    ##
##############################################
data <- data[,grep("subject_id|activity|mean|std",colnames(data),value=FALSE)]

##############################################
## step 3: apply desciptive actvity names   ##
##############################################
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("act_label_ID", "act_label_descr")
data$activity <- activity_labels[match(data$activity, activity_labels$act_label_ID) , 2]
rm(activity_labels)

##############################################
## step 4: apply descriptive variable names ##
##############################################
## Already done in step 1 by reading the features.txt file
## and using it as column names for the measurements data frame.
## I'm not sure what other names should be applied.

##############################################
## step 5: create independant tidy data set ##
##############################################
library(reshape2)
data2 <- melt(data, id.vars=c("activity","subject_id"))
data2 <- dcast(activity + subject_id ~ variable, data=data2, fun=mean)
data2 <- melt(data2, id.vars=c("subject_id", "activity"))

write.table(data2, file = "tidydata.txt", sep = ";", row.names = FALSE, quote=FALSE)
