# Getting & Cleaning Data Peer Assessment


This repository contains my work on a peer assessment for the Johns Hopkins/Coursera MOOC, Getting and Cleaning Data. 

The assignment relies on smartphone data from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


## run_analysis.R

This R script converts the mobile device motion data and performs the following operations:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

3) Uses descriptive activity names to name the activities in the data set.

4) Appropriately labels the data set with descriptive activity names. 

5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## tidyData.csv

This is the tidy dataset returned by `run_analysis.R`. It provides an average of each variable for each subject and each activity. 
