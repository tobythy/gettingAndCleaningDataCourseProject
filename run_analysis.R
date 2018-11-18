
# You should have a folder "UCI HAR Dataset" in your working directory to run this file
# You may download that file here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# read the data into variables in R 

# load test data 
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

# load train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

# merge test and train data
x_master <- rbind(x_test, x_train)
y_master <- rbind(y_test, y_train)
subject_master <- rbind(subject_test, subject_train)

# names of variables and activities 
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

# name the activity variable
names(y_train) <- "activity"
names(y_test) <- "activity"
# name the subejct variable 
names(subject_test) <- "subject.id"
names(subject_train) <- "subject.id"

# aplly the featurenames to the variable features 
names(x_test) <- features$V2
names(x_train) <- features$V2

# bind the documents togethere 
all_test <- cbind(subject_test, y_test, x_test)
all_train <- cbind(subject_train, y_train, x_train)
all_data <- rbind(all_test,all_train)

# create a document with the mean and standard deviation, (activity and subject.id)
all_data1 <- grepl("mean\\(\\)|std\\(\\)|subject.id|activity", names(all_data))
all_data2 <- all_data[,all_data1]

# name the data with appropiate activity labels
all_data2$activity <- factor(all_data2$activity, levels = activity_labels[,1], labels = activity_labels[,2])

# reshape the data with the reshape2 package
library(reshape2)
mixed <- melt(alldata2, id = c("subject.id", "activity"))
tidy_data <- dcast(mixed, subject.id + activity ~ variable, mean)

# write the data out as csv file
write.csv(tidy_data, "tidydata.csv", row.names=FALSE)
