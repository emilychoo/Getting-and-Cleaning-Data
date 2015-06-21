#[Step 1] Merges the training and the test sets to create one data set.

# creating the data folder if not exist
#if(!file.exists("./data")){dir.create("./data")}

# create a temp file and fetch the downloaded file into temp file
# extract temp file and remove it
#temp <- tempfile()
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
#unzip(temp, exdir = "./data") 
#unlink(temp)

# save training data, decision and subject into tables
trainingData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainingDecision <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
table(trainingDecision)
trainingSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# save testing data, decision and subject into tables
testingData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testingDecision <- read.table("./data/UCI HAR Dataset/test/y_test.txt") 
table(testingDecision) 
testingSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# save joint data, decision and subject into tables
jointData <- rbind(trainingData, testingData)
jointDecision <- rbind(trainingDecision, testingDecision)
jointSubject <- rbind(trainingSubject, testingSubject)


#[Step 2] Extracts only the measurements on the mean and standard deviation for each measurement.  
features <- read.table("./data/UCI HAR Dataset/features.txt")
MeanStdFeatures <- grep("mean\\(\\)|std\\(\\)", features[, 2])
jointData <- jointData[, MeanStdFeatures]
names(jointData) <- features[MeanStdFeatures, 2] 


# [Step 3] Uses descriptive activity names to name the activities in the data set 
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activity [2,2] <- "walkingUpStairs" 
activity [3,2] <- "walkingDownStairs"
activityLabel <- activity[jointDecision[, 1], 2]
jointDecision[, 1] <- activityLabel


# [Step 4] Appropriately labels the data set with descriptive variable names.
names(jointDecision) <- "Activity"
names(jointSubject) <- "Subject"
processedData <- cbind(jointSubject, jointData, jointDecision)
write.table(processedData, "TrainTestMergedData.txt")


# [Step 5] Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
totalSubject <- length(table(jointSubject)) 
totalActivity <- nrow(activity)
totalFeatures <- ncol(processedData)
tidyData <- matrix(NA, nrow=totalSubject*totalActivity, ncol=totalFeatures) 
tidyData <- as.data.frame(tidyData)
colnames(tidyData) <- colnames(processedData)
row <- 1
for(i in 1:totalSubject) {
  for(j in 1:totalActivity) {
    tidyData[row, 1] <- i
    tidyData[row, totalFeatures] <- activity[j, 2]
    checkSubject <- i == processedData$Subject
    checkActivity <- activity[j, 2] == processedData$Activity
    tidyData[row, 2:totalFeatures-1] <- colMeans(processedData[checkSubject&checkActivity, 2:totalFeatures-1])
    row <- row + 1
  }
}
write.table(tidyData, "ProcessedData.txt", row.name=FALSE) 

