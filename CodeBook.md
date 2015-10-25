## Getting and Cleaning Data Course Project CodeBook

October 24, 2015

Lynnsha Jing Huang

### Summary
This Codebook is constructed to provide additional information of the Getting and Cleaning
Course project that describes the variables, the data, and any transformations/work performed
to clean up the dataset provided by [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) webpage.

### Source
The original source data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It is then unzipped, saved to the Course project folder and used for further R cleaning analysis.

### Detailed Description
The datasets are desgined for a series of experiements, that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### Project Procedures:
a R script called run_analysis is created with the following 5 steps:
#### 1. Merge the traning and the test sets to create one data set.
A set of 8 text files from the data folder are read:  
-  **features.txt**, 
-  **activity_labels.txt**,  
-  **subject_train.txt**,  
-  **x_train.txt**,  
-  **y_train.txt**
-  **subject_test.txt**, 
-  **x_test.txt** , 
-  **y_test.txt**


