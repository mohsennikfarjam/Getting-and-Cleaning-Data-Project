# Getting and Cleaning Data Course Project

This repository is for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course. It has the instructions on how to run analysis on Human Activity recognition dataset.

## Dataset

*   **Dataset**: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files

*   `CodeBook.md` a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data
*   `run_analysis.R` performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
    1.  Merges the training and the test sets to create one data set.
    2.  Extracts only the measurements on the mean and standard deviation for each measurement.
    3.  Uses descriptive activity names to name the activities in the data set
    4.  Appropriately labels the data set with descriptive variable names.
    5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
*   `tidy_data.txt` is the exported final data after going through all the sequences described above.

## Usage

1.  Download the dataset and unzip it into the working directory. (The script handles downloading if the file doesn't exist, but looks for the folder `UCI HAR Dataset`).
2.  Run the script `run_analysis.R` in RStudio or via command line:
    ```bash
    Rscript run_analysis.R
    ```
3.  The output file `tidy_data.txt` will be generated in the working directory.
