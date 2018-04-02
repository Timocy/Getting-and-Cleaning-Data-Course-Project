# Code book for 'UCI HAR Dataset final_tidy_set.txt'
Features and applied workflows for this dataset is described below.

## Work flow
1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip the downloaded file.
3. Create separate data.frames for train, test, features, and activity labels from unzipped files.
   train_x : "/train/X_train.txt"
   train_y : "/train/y_train.txt"
   train_subject : "/train/subject_train.txt"
   test_x : "/test/X_test.txt"
   test_y : "/test/y_test.txt"
   test_subject : "/test/subject_test.txt"
   features : "/features.txt"
   activity_labels : "/activity_labels.txt"
4. Change column names of the created data.frames.
   train_x, test_x : Second column of 'features' data.frame.
   train_y, test_y : "activityID"
   train_subject, test_subject : "subjectID"
   activity_labels : "activityID", "activityType"
5. Merge data.frames
   train_merge : merging train_y, train_subject, train_x
   test_merge : merging test_y, test_subject, test_x
   all_merge : merging train_merge and test_merge
6. Feature extraction
   mean_std : A vector of columns including activityID, subjectID, and all columns with 'mean' and 'std'.
   mean_std_merge_set : Subset of 'all_merge' with columns included in 'mean_std'.
7. Aggregate the subset
   tidy_set : An aggregated set of mean_std_merge_set by subjectID and activityID
8. Activity labeling
   final_tidy_set : Merging tidy_set and activityLables by activityID.
9. Export the result as a file
   UCI HAR Dataset final_tidy_set.txt
   
## Feature description
### Key values
activityID : Identifier for activity.
subjectID : Identifier for subject.

### Measurement
[3] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
 [5] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"               
 [7] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
 [9] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
[11] "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
[13] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[15] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
[17] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"           
[19] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
[21] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
[23] "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
[25] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[27] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[29] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"          
[31] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[33] "tBodyAccMag-mean()"              "tBodyAccMag-std()"              
[35] "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
[37] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
[39] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
[41] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"         
[43] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[45] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"               
[47] "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
[49] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
[51] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
[53] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"          
[55] "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
[57] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"      
[59] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[61] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[63] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
[65] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"              
[67] "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
[69] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
[71] "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
[73] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
[75] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
[77] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"    
[79] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
[81] "fBodyBodyGyroJerkMag-meanFreq()

### Activity label (activityType)
activityType=1  :  WALKING  (subject was walking during the test)
activityType=2  :  WALKING_UPSTAIRS (subject was walking up a staircase during the test)
activityType=3  :  WALKING_DOWNSTAIRS (subject was walking down a staircase during the test)
activityType=4  :  SITTING (subject was sitting during the test)
activityType=5  :  STANDING (subject was standing during the test)
activityType=6  :  LAYING (subject was laying down during the test)


