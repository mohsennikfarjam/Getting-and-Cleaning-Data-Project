# CodeBook

This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The Data Source

*   **Original Data**: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*   **Description**: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## The Variables

The `run_analysis.R` script performs the following steps to clean the data:

1.  **Reads data**:
    *   `features` (561 rows, 2 columns): The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
    *   `activities` (6 rows, 2 columns): List of activities performed when the corresponding measurements were taken and its codes (labels).
    *   `subject_test` (2947 rows, 1 column): contains test data of 9/30 volunteer test subjects being observed.
    *   `x_test` (2947 rows, 561 columns): contains recorded features test data.
    *   `y_test` (2947 rows, 1 columns): contains test data of activities’code labels.
    *   `subject_train` (7352 rows, 1 column): contains train data of 21/30 volunteer subjects being observed.
    *   `x_train` (7352 rows, 561 columns): contains recorded features train data.
    *   `y_train` (7352 rows, 1 columns): contains train data of activities’code labels.

2.  **Merges the training and the test sets**:
    *   `X` (10299 rows, 561 columns): created by merging `x_train` and `x_test`.
    *   `Y` (10299 rows, 1 column): created by merging `y_train` and `y_test`.
    *   `Subject` (10299 rows, 1 column): created by merging `subject_train` and `subject_test`.
    *   `Merged_Data` (10299 rows, 563 columns): created by merging `Subject`, `Y` and `X`.

3.  **Extracts mean and standard deviation**:
    *   `TidyData`: subset of `Merged_Data`, selecting only columns: `subject`, `code` and the measurements on the mean and standard deviation (std) for each measurement.

4.  **Uses descriptive activity names**:
    *   Entire numbers in `code` column of the `TidyData` replaced with corresponding activity taken from second column of the `activities` variable.

5.  **Labels the data set with descriptive variable names**:
    *   `code` column in `TidyData` renamed into `activity`.
    *   `Acc` in column’s name replaced by `Accelerometer`
    *   `Gyro` in column’s name replaced by `Gyroscope`
    *   `BodyBody` in column’s name replaced by `Body`
    *   `Mag` in column’s name replaced by `Magnitude`
    *   `^t` in column’s name replaced by `Time`
    *   `^f` in column’s name replaced by `Frequency`
    *   `tBody` in column’s name replaced by `TimeBody`
    *   `-mean()` in column’s name replaced by `Mean`
    *   `-std()` in column’s name replaced by `STD`
    *   `-freq()` in column’s name replaced by `Frequency`
    *   `angle` in column’s name replaced by `Angle`
    *   `gravity` in column’s name replaced by `Gravity`

6.  **Creates a second, independent tidy data set**:
    *   `FinalData` (180 rows, 88 columns): created by summarizing `TidyData` taking the means of each variable for each activity and each subject, after grouped by subject and activity.
    *   Exported `FinalData` into `tidy_data.txt` file.

