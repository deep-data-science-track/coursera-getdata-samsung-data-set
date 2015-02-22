# Code Book: Cleaning and Extracting Data from Human Activity Recognition Using Smartphones Data Set

**Draft Code Book**
February 22, 2015
Code Book prepared by Deep Bhattacharya, based on the data set published [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Steps

- Initial data provided [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)
- In the data set folder
    * features.txt contains the feature vector names
    * activity_labels.txt contains a label describing each type of activity code
    * the subfolders test and train contain testing and training data respectively
    * e.g. subject_test contains the subject number, X_test the feature observations and Y_test the activity code
- Then we run the script "run_analysis.R" which behaves as described below

- First we merge horizontally the subject, activity and observations for training
    * The column names are "subject", "activity" followed by all the names defined in features.txt
- Then we repeat the same for test
- Finally we merge the two data sets vertically
- Next we filter out all the feature columns which do not stand for a mean or standard derivation observation
    * We filter the column names and keep the ones with mean or std in them
    * We also keep subject and activity
    * We do not measure the angle variables derived using other mean variables like gravityMean, since these are not means themselves
- Then we overwrite the values in the activity column to provide proper descriptions instead of codes
    * 1 -> "Walking"
    * 2 -> "Walking Upstairs"
    * 3 -> "Walking Downstairs"
    * 4 -> "Sitting"
    * 5 -> "Standing"
    * 6 -> "Laying"
- Next we melt the data set using subject and activity as id and the features as measure variables (with NAs removed)
- Finally we cast the data set by taking the mean of each variable for subject + activity
- Now our data set final_data is ready with 180 objects (30 subjects times 6 activities) of 81 variables
- We write this data set into a file 'final_data.txt'

## Output data definition
 
 The output file can be read using the code in R:

 - final_data = read.table(file_path, header = TRUE)
 
 **Data definition**
 - subject (volunteer number 1-30)
 - activity ("Walking" / "Walking Upstairs" / "Walking Downstairs" / "Sitting" / "Standing" / "Laying")
 - 81 measurement observations, each an average for the subject+activity combination
    + tBodyAcc.mean...X
    + tBodyAcc.mean...Y
    + tBodyAcc.mean...Z
    + tBodyAcc.std...X
    + tBodyAcc.std...Y
    + tBodyAcc.std...Z
    + tGravityAcc.mean...X
    + tGravityAcc.mean...Y
    + tGravityAcc.mean...Z
    + tGravityAcc.std...X
    + tGravityAcc.std...Y
    + tGravityAcc.std...Z
    + tBodyAccJerk.mean...X
    + tBodyAccJerk.mean...Y
    + tBodyAccJerk.mean...Z
    + tBodyAccJerk.std...X
    + tBodyAccJerk.std...Y
    + tBodyAccJerk.std...Z
    + tBodyGyro.mean...X
    + tBodyGyro.mean...Y
    + tBodyGyro.mean...Z
    + tBodyGyro.std...X
    + tBodyGyro.std...Y
    + tBodyGyro.std...Z
    + tBodyGyroJerk.mean...X
    + tBodyGyroJerk.mean...Y
    + tBodyGyroJerk.mean...Z
    + tBodyGyroJerk.std...X
    + tBodyGyroJerk.std...Y
    + tBodyGyroJerk.std...Z
    + tBodyAccMag.mean..
    + tBodyAccMag.std..
    + tGravityAccMag.mean..
    + tGravityAccMag.std..
    + tBodyAccJerkMag.mean..
    + tBodyAccJerkMag.std..
    + tBodyGyroMag.mean..
    + tBodyGyroMag.std..
    + tBodyGyroJerkMag.mean..
    + tBodyGyroJerkMag.std..
    + fBodyAcc.mean...X
    + fBodyAcc.mean...Y
    + fBodyAcc.mean...Z
    + fBodyAcc.std...X
    + fBodyAcc.std...Y
    + fBodyAcc.std...Z
    + fBodyAcc.meanFreq...X
    + fBodyAcc.meanFreq...Y
    + fBodyAcc.meanFreq...Z
    + fBodyAccJerk.mean...X
    + fBodyAccJerk.mean...Y
    + fBodyAccJerk.mean...Z
    + fBodyAccJerk.std...X
    + fBodyAccJerk.std...Y
    + fBodyAccJerk.std...Z
    + fBodyAccJerk.meanFreq...X
    + fBodyAccJerk.meanFreq...Y
    + fBodyAccJerk.meanFreq...Z
    + fBodyGyro.mean...X
    + fBodyGyro.mean...Y
    + fBodyGyro.mean...Z
    + fBodyGyro.std...X
    + fBodyGyro.std...Y
    + fBodyGyro.std...Z
    + fBodyGyro.meanFreq...X
    + fBodyGyro.meanFreq...Y
    + fBodyGyro.meanFreq...Z
    + fBodyAccMag.mean..
    + fBodyAccMag.std..
    + fBodyAccMag.meanFreq..
    + fBodyBodyAccJerkMag.mean..
    + fBodyBodyAccJerkMag.std..
    + fBodyBodyAccJerkMag.meanFreq..
    + fBodyBodyGyroMag.mean..
    + fBodyBodyGyroMag.std..
    + fBodyBodyGyroMag.meanFreq..
    + fBodyBodyGyroJerkMag.mean..
    + fBodyBodyGyroJerkMag.std..
    + fBodyBodyGyroJerkMag.meanFreq..