install.packages("dplyr")
library("dplyr")

run_analysis <- function(){
    
    ##pulls and relabels subjects for test set
    subjects_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    subjects_test <- rename(subjects_test, Subjects = V1)
    
    #pulls and relabels activities for test set
    activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
    for(i in 1:length(activities_test[,1])){
        if(activities_test[i,1] == 1){
            activities_test[i,1] <- "WALKING"
        }
        else if(activities_test[i,1] == 2){
            activities_test[i,1] <- "WALKING_UPSTAIRS"
        }
        else if(activities_test[i,1] == 3){
            activities_test[i,1] <- "WALKING_DOWNSTAIRS"
        }
        else if(activities_test[i,1] == 4){
            activities_test[i,1] <- "SITTING"
        }
        else if(activities_test[i,1] == 5){
            activities_test[i,1] <- "STANDING"
        }
        else if(activities_test[i,1] == 6){
            activities_test[i,1] <- "LAYING"
        }
    }
    activities_test <- rename(activities_test, Activities = V1)
    
    ##pulls raw data for test set
    data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    
    ##merges subjects_test, activitites_test, and final_df
    final_test <- cbind(subjects_test, activities_test, data_test)
    
    
    ##pulls and relabels subjects for train set
    subjects_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    subjects_train <- rename(subjects_train, Subjects = V1)
    
    #pulls and relabels activities for train set
    activities_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    for(i in 1:length(activities_train[,1])){
        if(activities_train[i,1] == 1){
            activities_train[i,1] <- "WALKING"
        }
        else if(activities_train[i,1] == 2){
            activities_train[i,1] <- "WALKING_UPSTAIRS"
        }
        else if(activities_train[i,1] == 3){
            activities_train[i,1] <- "WALKING_DOWNSTAIRS"
        }
        else if(activities_train[i,1] == 4){
            activities_train[i,1] <- "SITTING"
        }
        else if(activities_train[i,1] == 5){
            activities_train[i,1] <- "STANDING"
        }
        else if(activities_train[i,1] == 6){
            activities_train[i,1] <- "LAYING"
        }
    }
    activities_train <- rename(activities_train, Activities = V1)
    
    ##pulls raw data for train set
    data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    
    ##merges subjects_train, activitites_train, and final_train
    final_train <- cbind(subjects_train, activities_train, data_train)
    
    ##merges test and train sets
    final_df <- rbind(final_test, final_train)
    
    #filters out and relabels mean and std columns only
    final_df <- select(final_df, c(Subjects:Activities, V1:V6, V41:V46, V81:V86, V121:V126, V161:V166, V201:V202, V214:V215, 
        V227:V228, V240:V241, V266:V271, V345:V350, V424:V429, V503:V504, V516:V517, V529:V530, V542:V543))  
    
    final_df <- rename(final_df, "tBodyAcc-mean()-X" = V1, "tBodyAcc-mean()-Y" = V2, "tBodyAcc-mean()-Z" = V3)
    final_df <- rename(final_df, "tBodyAcc-std()-X" = V4, "tBodyAcc-std()-Y" = V5, "tBodyAcc-std()-Z" = V6)
    final_df <- rename(final_df, "tGravityAcc-mean()-X" = V41, "tGravityAcc-mean()-Y" = V42, "tGravityAcc-mean()-Z" = V43)
    final_df <- rename(final_df, "tGravityAcc-std()-X" = V44, "tGravityAcc-std()-Y" = V45, "tGravityAcc-std()-Z" = V46)
    final_df <- rename(final_df, "tBodyAccJerk-mean()-X" = V81, "tBodyAccJerk-mean()-Y" = V82, "tBodyAccJerk-mean()-Z" = V83)
    final_df <- rename(final_df, "tBodyAccJerk-std()-X" = V84, "tBodyAccJerk-std()-Y" = V85, "tBodyAccJerk-std()-Z" = V86)
    final_df <- rename(final_df, "tBodyGyro-mean()-X" = V121, "tBodyGyro-mean()-Y" = V122, "tBodyGyro-mean()-Z" = V123)
    final_df <- rename(final_df, "tBodyGyro-std()-X" = V124, "tBodyGyro-std()-Y" = V125, "tBodyGyro-std()-Z" = V126)
    final_df <- rename(final_df, "tBodyGyroJerk-mean()-X" = V161, "tBodyGyroJerk-mean()-Y" = V162, "tBodyGyroJerk-mean()-Z" = V163)
    final_df <- rename(final_df, "tBodyGyroJerk-std()-X" = V164, "tBodyGyroJerk-std()-Y" = V165, "tBodyGyroJerk-std()-Z" = V166)
    final_df <- rename(final_df, "tBodyAccMag-mean()" = V201, "tBodyAccMag-std()" = V202)
    final_df <- rename(final_df, "tGravityAccMag-mean()" = V214, "tGravityAccMag-std()" = V215)
    final_df <- rename(final_df, "tBodyAccJerkMag-mean()" = V227, "tBodyAccJerkMag-std()" = V228)
    final_df <- rename(final_df, "tBodyGyroMag-mean()" = V240, "tBodyGyroMag-std()" = V241)
    final_df <- rename(final_df, "fBodyAcc-mean()-X" = V266, "fBodyAcc-mean()-Y" = V267, "fBodyAcc-mean()-Z" = V268)
    final_df <- rename(final_df, "fBodyAcc-std()-X" = V269, "fBodyAcc-std()-Y" = V270, "fBodyAcc-std()-Z" = V271)
    final_df <- rename(final_df, "fBodyAccJerk-mean()-X" = V345, "fBodyAccJerk-mean()-Y" = V346, "fBodyAccJerk-mean()-Z" = V347)
    final_df <- rename(final_df, "fBodyAccJerk-std()-X" = V348, "fBodyAccJerk-std()-Y" = V349, "fBodyAccJerk-std()-Z" = V350)
    final_df <- rename(final_df, "fBodyGyro-mean()-X" = V424, "fBodyGyro-mean()-Y" = V425, "fBodyGyro-mean()-Z" = V426)
    final_df <- rename(final_df, "fBodyGyro-std()-X" = V427, "fBodyGyro-std()-Y" = V428, "fBodyGyro-std()-Z" = V429)
    final_df <- rename(final_df, "fBodyAccMag-mean()" = V503, "fBodyAccMag-std()" = V504)
    final_df <- rename(final_df, "fBodyBodyAccJerkMag-mean()" = V516, "fBodyBodyAccJerkMag-std()" = V517)
    final_df <- rename(final_df, "fBodyBodyGyroMag-mean()" = V529, "fBodyBodyGyroMag-std()" = V530)
    final_df <- rename(final_df, "fBodyBodyGyroJerkMag-mean()" = V542, "fBodyBodyGyroJerkMag-std()" = V543)
    
    
    ##creates new data frame which takes the mean of each mean/std measurement per subject per activity
    temp_unique <- unique(final_df[,1:2])
    final_df_means <- final_df[1:length(temp_unique[,1]),]
    final_df_means[,1] <- temp_unique[,1]
    final_df_means[,2] <- temp_unique[,2]
    
    for(i in 1:length(temp_unique[,1]))
    {
        temp_index_vector <- which(final_df[,1] == temp_unique[i,1] & final_df[,2] == temp_unique[i,2])
        for(j in 3:length(final_df[1,])){
            temp_mean <- mean(final_df[temp_index_vector,j])
            final_df_means[i, j] <- temp_mean
        }
    }
    
  ##creates final tidy data file in current directory
  write.table(final_df_means, file = "tidy_data_wearables.txt", row.name = FALSE)
       
}