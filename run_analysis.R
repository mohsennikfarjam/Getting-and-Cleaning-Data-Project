library(dplyr)

# 0. Download and unzip dataset (Optional, for reproducibility if not already present)
filename <- "UCI HAR Dataset.zip"
if (!file.exists(filename) && !dir.exists("UCI HAR Dataset")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
  unzip(filename)
}

# 1. Merge the training and the test sets to create one data set.
# Reading features and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Reading Training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Reading Test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Merging data
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

# 3. Use descriptive activity names to name the activities in the data set
TidyData$code <- activities[TidyData$code, 2]

# 4. Appropriately label the data set with descriptive variable names.
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalData <- TidyData %>%
    group_by(subject, activity) %>%
    summarise_all(mean)

write.table(FinalData, "tidy_data.txt", row.name=FALSE)
