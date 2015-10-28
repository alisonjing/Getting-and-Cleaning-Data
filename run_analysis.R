# John Hopkins University- Getting and Cleaning Data Course Project

# The purpose of this project is to demonstrate your ability to collect, work with and 
# clean a data set. The goal is to prepare tidy data that can be used for later analysis.

# Things required to submit:
#1) a tidy data set as described below
#2) a link to a Github repository with your script for performing the analysis
#3) a code book that describes the variables, the data, and any transformations or work that 
# you performed to clean up the data called CodeBook.md. You should also include a README.md 
# in the repo with your scripts. 
########################################################################################################

# 1) Merge the training and the test sets to create one data set.

# install reshape2 package
install.packages("reshape2")

# Load add-on reshape2 package for flexibily restructing and aggregating data
library(reshape2)

# check current working directory
getwd()
# Reset working directory to the location where the zipped file was downloaded
setwd("C:/Users/Lynnsha/Documents/R/Course4W1/Getting and Cleaning Data/Course Project")

## Download and unzip the dataset using if statement:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename)
}
if (!file.exists.("UCI HAR Dataset")) {
  unzip(filename)
}

# Import data from the file folder
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <-as.character(features[,2])
activityLabels <-read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <-as.character(features[,2])


# 2) Extracts only the measurements on the mean and standard deviation for each 
# measurement.
featureSelected <- grep('. *mean.*|. *std.*', features[,2]) 
featureSelected.names <- features[featureSelected,2]
featureSelected.names = gsub('-mean', 'Mean', featureSelected.names)
featureSelected.names = gsub('-std', 'std', featureSelected.names)
featureSelected.names <- gsub('[-()]', '', featureSelected.names)

# 3) Use descriptive activity names to name the activities in the data set
# Load the datasets from the file
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
xtrain <-read.table("UCI HAR Dataset/train/x_train.txt")[featureSelected]

# Merging trainSubjects, trainActivities, and train for a final train dataset
train <-cbind(trainSubjects, trainActivities, xtrain)

testSubjects <-read.table("UCI HAR Dataset/test/sub_train.txt")
testActivities <-read.table("UCI HAR Dataset/test/y_test.txt")
xtest <-read.table("UCI HAR Dataset/test/x_test.txt")[featureSelected]

# Merging testSubjects, testActivities, and test data for a final test dataset
test <-cbind(testSubjects, testActivities, xtest)

# Merge both the train dataset and test dataset into a final one 
finalData <- rbind(train, test)

# 4) Appropriately label the data set with descriptive variable names
labels<-c("Subject", "Activity_ID","Activity_Label")
data_labels = setdiff(colnames(data), labels)

# use melt() function to melt wide-format data into long-format data 
melt_data= melt(data, id=labels, measure.vars=data_labels)


# 5) From the data set in Step 4, creates a second, independently tidy data set with the average
# of each variable for each activity and each subject.

# First Use dcast() function to reshape the data frame with the mean function applied
tidy_data = dcast(melt_data, subject+ Activity_Label ~ variable, mean)

# Finally we create a separate tidy dataset in txt format using 
# row.names=FALSE as indicated in the guideline
write.table(tidy_data, file="./tidy_data.txt", row.names = FALSE, quote = FALSE)




