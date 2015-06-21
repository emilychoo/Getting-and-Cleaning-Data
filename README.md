#Coursera Data Science: Getting and Cleaning Data Peer Assignment
Course Project README

This is a README file explaining how run_analysis.R code works.

1) Download the "run_analysis.R" into the current working directory.
2) Run the following scripts to download and unzip the data files into the same working directory where the "run_analysis.R" is located.

****************************************************************************************************************************************
if(!file.exists("./data")){dir.create("./data")}
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp, exdir = "./data") 
unlink(temp)

****************************************************************************************************************************************

3) Type the source("run_analysis.R") command in RStudio.

4) The scripts will retrieve the training data and testing data separately before saving them into different tables. Then, these 2 tables will be combine using rbing command to form the joint data file.

5) Next, the scripts will match the features value from the features text file available in the downloaded data folder, and assign them to the joint data. Only the mean and standard deviation from each measurement will be retrived.

6) Then, the scripts will use descriptive activity names to name the activities in the joint data set.

7) The scripts will appropriately label the data set with descriptive variable names.

8) Next, it will create a separate and independent tidy data set with the average of each variable for each activity and each subject.

9) You should get 2 output files, i.e.TrainTestMergedData.txt and ProcessedData.txt, in the current working directory upon successfully running the run_analysis.R scripts.The TrainTestMergedData.txt is the merged dataset generated from combing the training and testing data containing the measurements on the mean and standard deviation for each measurement. The ProcessedData.txt contains the independent tidy data set with the average of each variable for each activity and each subject generated from the TrainTestMergedData.txt.

10) Besides, you can also use the data <- read.table("ProcessedData.txt") command in RStudio to read the tidy data set.


