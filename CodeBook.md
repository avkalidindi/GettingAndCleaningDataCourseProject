# Getting And Cleaning Data Course Project - Code Book

This code explains the data and the transformation performed to get the output needed for the final project of the course - **Getting and Cleaning Data**.

The data was downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracted into the folder **UCI HAR Dataset**.

The script **run_analysis.R** needs the data folder **UCI HAR Dataset** to be present in the same folder it is in. The script also needs the tidyverse package installed.

The **UCI HAR Dataset** is split into train and test datasets. Both share the same format.
The train data set is further split into subject_train.txt, X_train.txt and y_train.txt and the same is the test data set. The 3 txt files contain in each row the subject for whom the sensor data was captured (subject_train.txt), the activity for which the sensor data was captured (y_train.txt) and the 561 features from sensor data as vector in each row for each subject and activity (X_train.txt)

The activity names are available in activity_labels.txt. The feature names are available in features.txt.

The analysis script "run_analysis.R" first starts with train data, gets the activity names and adds it a new column "ActivityName" to the data from "y_train.txt" file, using the data in activity_labels.txt. For the feature data, the script reads from the "X_train.txt" and uses the feature names from "features.txt" to add as column names. And finally, column binds the 3 tables/data frames, i.e., the subjects, activities, and features of the sensor data collected for a combination of subject and activity.

The same steps are repeated for the test data. And then the train and test data are combined to get the final data.

Once the final data with train and test combined is available, the script selects/extracts the subject, activity related columns and the columns(feature) that are mean or standard deviation of the sensor data measurements.
The final data set has these columns:
"SubjectId" "ActivityId" "ActivityName" "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" "tBodyGyro-mean()-X" "tBodyGyro-mean()-Y" "tBodyGyro-mean()-Z" "tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" "tBodyAccMag-mean()" "tGravityAccMag-mean()" "tBodyAccJerkMag-mean()" "tBodyGyroMag-mean()" "tBodyGyroJerkMag-mean()" "fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" "fBodyGyro-mean()-Z" "fBodyAccMag-mean()" "fBodyBodyAccJerkMag-mean()" "fBodyBodyGyroMag-mean()" "fBodyBodyGyroJerkMag-mean()" "tBodyAcc-std()-X" "tBodyAcc-std()-Y" "tBodyAcc-std()-Z" "tGravityAcc-std()-X" "tGravityAcc-std()-Y" "tGravityAcc-std()-Z" "tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" "tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" "tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" "tBodyAccMag-std()" "tGravityAccMag-std()" "tBodyAccJerkMag-std()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-std()" "fBodyAcc-std()-X" "fBodyAcc-std()-Y" "fBodyAcc-std()-Z" "fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" "fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" "fBodyAccMag-std()" "fBodyBodyAccJerkMag-std()" "fBodyBodyGyroMag-std()" "fBodyBodyGyroJerkMag-std()"

And as the last step, compute mean of the above extracted feature columns for each subject and activity and saves the summarized data as "means_byuserandactivity.txt"
