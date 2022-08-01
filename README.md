# Getting And Cleaning Data Course Project

This repo contains the code and data for the final project of the course - **Getting and Cleaning Data**.

The data was downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracted into the folder **UCI HAR Dataset**.

The script **run_analysis.R** needs the data folder **UCI HAR Dataset** to be present in the same folder it is in. The script also needs the tidyverse package installed.

The **UCI HAR Dataset** is split into train and test datasets. Both share the same format.
The train data set is further split into subject_train.txt, X_train.txt and y_train.txt and the same is the test data set. The 3 txt files contain in each row the subject for whom the sensor data was captured (subject_train.txt), the activity for which the sensor data was captured (y_train.txt) and the 561 features from sensor data as vector in each row for each subject and activity (X_train.txt)

The activity names are available in activity_labels.txt. The feature names are available in features.txt.

The analysis script "run_analysis.R" first starts with train data, gets the activity names and adds it a new column "ActivityName" to the data from "y_train.txt" file, using the data in activity_labels.txt. For the feature data, the script reads from the "X_train.txt" and uses the feature names from "features.txt" to add as column names. And finally, column binds the 3 tables/data frames, i.e., the subjects, activities, and features of the sensor data collected for a combination of subject and activity.

The same steps are repeated for the test data. And then the train and test data are combined to get the final data.

Once the final data with train and test combined is available, the script selects/extracts the subject, activity related columns and the columns(feature) that are mean or standard deviation of the sensor data measurements.

And as the last step, compute mean of the above extracted feature columns for each subject and activity and saves the summarized data as "means_byuserandactivity.txt"
