# 1. Download and unzip the dataset:
filename <- "dataset.zip"
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, method="curl")
        unzip(zipfile=filename, exdir="./Coursera_data")
}
print("Download and unzip data completed")



# 2. Creating data set
datalocation <- paste(getwd(),"/Coursera_data/UCI HAR Dataset", sep='')

### Reading training sets
train_x <- read.table(file.path(datalocation, "train", "X_train.txt"), header=FALSE)
train_y <- read.table(file.path(datalocation, "train", "y_train.txt"), header=FALSE)
train_subject <- read.table(file.path(datalocation, "train", "subject_train.txt"), header=FALSE)
print("Training data load completed")

### Reading test sets
test_x <- read.table(file.path(datalocation, "test", "X_test.txt"), header=FALSE)
test_y <- read.table(file.path(datalocation, "test", "y_test.txt"), header=FALSE)
test_subject <- read.table(file.path(datalocation, "test", "subject_test.txt"), header=FALSE)
print("Test data load completed")

### Reading features.txt
features <- read.table(file.path(datalocation, "features.txt"), header=FALSE)
print("Feature data load completed")

### Reading activity labels
activity_labels <- read.table(file.path(datalocation, "activity_labels.txt"), header=FALSE)
print("Activity labels load completed")



# 3. Column naming
## Rename columns (train)
colnames(train_x) <- features[,2]
colnames(train_y) <- "activityID"
colnames(train_subject) <- "subjectID"

# Rename columns (test)
colnames(test_x) <- features[,2]
colnames(test_y) <- "activityID"
colnames(test_subject) <- "subjectID"

# Rename columns (activity labels)
colnames(activity_labels) <- c("activityID", "activityType")
print("Column rename completed")



# 4. Merge
## Merge data
train_merge <- cbind(train_y, train_subject, train_x)
test_merge <- cbind(test_y, test_subject, test_x)
all_merge <- rbind(train_merge, test_merge)
print("Data merge completed")



# 5. Feature extraction and subset creation (mean and std)
## Define the columns with the names including 'means' and 'std'
allcolnames <- colnames(all_merge)
mean_std <- (grepl("activityID", allcolnames) | grepl("subjectID", allcolnames) | 
             grepl("mean..", allcolnames) | grepl("std..", allcolnames))

## Create subset of mean and std
mean_std_merge_set <- all_merge[ ,mean_std == TRUE]
print("Mean and std subset created")



# 6. New tidy set creation
## Aggregate the all merged set based on activityID and subjectID
tidy_set <- aggregate(.~subjectID + activityID, mean_std_merge_set, mean)
tidy_set <- tidy_set[order(tidy_set$subjectID, tidy_set$activityID), ]
print("Tidy set created")



# 7. Add activity labels as a new column
final_tidy_set <- merge(tidy_set, activity_labels, by="activityID", all.x=TRUE)
print("Activity labeled")



# 8. Create a file for final_tidy_set
write.table(final_tidy_set, paste(datalocation,"final_tidy_set.txt"), row.name=FALSE)
print("File created")



