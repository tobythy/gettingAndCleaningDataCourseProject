
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

# names of variables and and activities 
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

# apply feature names to column names in x_master
names(x_master) <- features$V2

# change column name in y_master to "activity"
names(y_master) <- "activity"

# change column name in subject_master to "subject.id"
names(subject_master) <- "subject.id"

# create descriptive labels for activities
y_master$activity <- factor(y_master$activity, levels = activity_labels[,1], labels = activity_labels[,2])

# merge datasets by column
all_data <- cbind(subject_master, y_master, x_master)

# reshape data the data with the reshape2 package
library(reshape2)

# new column "variable" will contian the various features and "value" will contain their observed value
all_melt <- melt(all_data, id = c("subject.id", "activity"))
tidydata <- dcast(all_melt, subject.id + activity ~ variable, mean)

# write the data out as csv file
write.csv(tidydata, "tidydata.csv", row.names=FALSE)

