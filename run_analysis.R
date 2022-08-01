library(tidyverse)

#download the data and extract.
folder_check <- "UCI HAR Dataset"
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(folder_check)) {
    download.file(data_url, destfile = "activity_data.zip")
    unzip(zipfile = "activity_data.zip")
}

#Load Activity labels and Feature names.
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityId","ActivityName"))
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("FeatureId","FeatureName"))

#start with loading training data sets.
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("SubjectId"))
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("ActivityId"))
training_data <- read.table("./UCI HAR Dataset/train/X_train.txt")

#when reading training or test data the read table function is replacing -,(,) characters with . in the column names
#so instead using colnames base function.
colnames(training_data) <- features$FeatureName

#add activity name into the training data set.
activity_train$ActivityName <- sapply(activity_train$ActivityId, function(activity_id){activities$ActivityName[activity_id]})

#combine subjects, activities and features training data into one data set.
training_data <- bind_cols(subject_train, activity_train, training_data)

#repeat the above steps to load test data sets.
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("SubjectId"))
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("ActivityId"))
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

#when reading training or test data the read table function is replacing -,(,) characters with . in the column names
#so instead using colnames base function.
colnames(test_data) <- features$FeatureName

#add activity name into the test data set.
activity_test$ActivityName <- sapply(activity_test$ActivityId, function(activity_id){activities$ActivityName[activity_id]})

#combine subjects, activities and features test data into one data set.
test_data <- bind_cols(subject_test, activity_test, test_data)

#combine training and test data sets.
final <- bind_rows(training_data, test_data)

#extract only mean and std measurements/features.
final <- final %>% select(1:3, contains("mean()") | contains("std()"))

#mean of all mean and std measurements extracted above by subject and activity
final_mean <- final %>% group_by(SubjectId, ActivityId, ActivityName) %>% summarise_all(mean)

#save the above mean data set.
write.table(final_mean, file = "means_byuserandactivity.txt", row.names = FALSE)
