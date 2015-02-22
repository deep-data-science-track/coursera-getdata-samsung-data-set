# run_analysis.R

library(reshape)

# Step 1: Merge the training and the test sets to create one data set.

# Get the list of features
feature_list <- read.table('UCI HAR Dataset/features.txt', header = FALSE, col.names = c('feature_id', 'feature_name'))

# Loading training data
subjects_train <- read.table('UCI HAR Dataset/train/subject_train.txt', header = FALSE, col.names = c('subject'))
activities_train <- read.table('UCI HAR Dataset/train/y_train.txt', header = FALSE, col.names = c('activity'))
features_train <- read.table('UCI HAR Dataset/train/x_train.txt', header = FALSE, col.names = feature_list[, 2])
raw_data_train <- cbind(subjects_train, activities_train, features_train)

# Loading test data
subjects_test <- read.table('UCI HAR Dataset/test/subject_test.txt', header = FALSE, col.names = c('subject'))
activities_test <- read.table('UCI HAR Dataset/test/y_test.txt', header = FALSE, col.names = c('activity'))
features_test <- read.table('UCI HAR Dataset/test/x_test.txt', header = FALSE, col.names = feature_list[, 2])
raw_data_test <- cbind(subjects_test, activities_test, features_test)

# Merge subjects, activities and features into a single data set
raw_data <- rbind(raw_data_train, raw_data_test)

# Step 1 Complete

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

# Looking at feature list we notice the feature_name has mean() or std() within it
# We do not consider the angle variables derived using other mean variables like gravityMean, since the angles are not means themselves
required_columns <- grepl("mean()|std()", names(raw_data))
# We also need subject and activity
required_columns[1:2] <- TRUE
mean_std_data <- raw_data[, required_columns]

# Step 2 Complete

# Step 3: Use descriptive activity names to name the activities in the data set

# Check the list of activities
# activity_list <- read.table('UCI HAR Dataset/activity_labels.txt', header = FALSE, col.names = c("activity_id", "activity_label"))
# Replace activities with text descriptions
mean_std_data[mean_std_data$activity == 1, ][, 2] <- "Walking"
mean_std_data[mean_std_data$activity == 2, ][, 2] <- "Walking Upstairs"
mean_std_data[mean_std_data$activity == 3, ][, 2] <- "Walking Downstairs"
mean_std_data[mean_std_data$activity == 4, ][, 2] <- "Sitting"
mean_std_data[mean_std_data$activity == 5, ][, 2] <- "Standing"
mean_std_data[mean_std_data$activity == 6, ][, 2] <- "Laying"

# Step 3 Complete

# Step 4: Appropriately label the data set with descriptive variable names
# We are using the variable names as in the feature list of the original

# Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject
melted_samsung_data <- melt(mean_std_data, id=c("subject", "activity"), measure.vars = 3:81, na.rm = TRUE)
final_data <- dcast(melted_samsung_data, subject + activity ~ variable, mean)
write.table(final_data, file = 'final_data.txt', sep = ' ', row.names = FALSE)