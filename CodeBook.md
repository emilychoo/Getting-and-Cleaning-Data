#Coursera Data Science: Getting and Cleaning Data Peer Assignment
Course Project CodeBook

This CodeBook gives a brief introduction on the project and describes all the variables used in the "run_analysis.R" script file

Project Background:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The "run_analysis.R" scripts contain the following steps to pre-processed the data:

1) Read the "X_train.txt", "y_train.txt" and "subject_train.txt" data from the "./data/UCI HAR Dataset/train" folder into tables and store them in trainingData, trainingDecision and trainingSubject variables respectively.

2) Read the "X_test.txt", "y_test.txt" and "subject_test.txt" data from the "./data/UCI HAR Dataset/test" folder into tables and store them in testingData, testingDecision and testingSubject variables respectively.

3) Combine the testingData to trainingData to generate the jointData data frame; combine the testingDecision to trainingDecision to generate the jointDecision data frame; combine the testingSubject to trainingSubject to generate the jointSubject data frame.

4) Read the "features.txt" file from the "./data/UCI HAR Dataset/" folder and store the data in the features variable.

5) Extracts only the measurements on the mean and standard deviation for each measurement by using the grep() matching command and store the values into the MeanStdFeatures vector.

6) Read the "activity_labels.txt" file from the "./data/UCI HAR Dataset/" folder and store it in a variable called activity.

7) Convert the activities labels into lower cases and remove the underscore ("_") if it exists in any of the activity labels.

8) Convert the "walkingupstairs" and the "walkingdownstairs" to "walkingUpStairs" and "walkingDownStairs" respectively.

9) Store the activity values in the jointDecision data frame according to the activity data frame.

10) Set the feature name of the jointDecision and the jointSubject data frames to "Activity" and "Subject" respectively.

11) Combine the jointSubject, jointData and jointDecision using cbind() command to produce a new "processedData" data frame, and write it to the "TrainTestMergedData.txt" file using the write.table() command to store in the current working directory. The "Subject" column contains integers represent target subjects that range from 1 to 30; the next 66 columns contain mean and standard deviation measurements that range from -1 to 1; while the last column, the "Activity" column contains 6 kinds of activity names.

12) Next, creates a second, independent "tidyData" data frame to store the average of each variable for each activity and each subject. There are 30 target subjects and 6 different activities, which make up to a 180 x 68 dimension data frame storing different mean and standard deviation values according the subject and activity combination. 

13) Two "for" loops are used to store the mean value of each combination into the "tidyData" data frame.

14) Lastly, write the result to the "ProcessedData.txt" file using the write.table() command and store in the current working directory. THe row names are obmitted using the row.name=FALSE command.
