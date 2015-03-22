------Using run_analysis.R------

run_analysis() is an R script which will create a tidy data set out of a folder called "UCI HAR Dataset" in the same directory.
In order to run run_analysis(), the "dplyr" package must be installed and called (present at the top of run_analysis.R file)
run_analysis() uses the following order of operations -

1) Creates a one column data frame out of "subject_test.txt" from the "test" folder signifying a set of subjects
2) Creates a one column data frame out of "y_test.txt" from the "test" folder signifying a set of activities
3) Renames each activity number with the proper activity label as defined in "activity_labels.txt"
4) Creates a data frame for all measurement values in "X_test.txt" from the "test" folder
5) Cbinds these three separate data frames to match all subjects, activities, and resultant measurements
6) Steps 1 through 4 are repeated for the "train" folder
7) The cbinded data frames created in steps 5 and 6 are rbinded to create one data frame
8) All columns not corresponding to mean or std values are filtered out using "features.txt" as a reference
9) All remaining columns are relabeled using as prescribed by "features.txt"
10) A new data frame is created which outputs the mean of each measurement for each subject/activity pair
11) A new file called "tidy_data_wearables.txt" is then created from this data frame using write.table()
