------Using run_analysis.R------

run_analysis() is an R script which will create a tidy data set out of a folder called "UCI HAR Dataset" in the same directory.
In order to run run_analysis(), the "dplyr" package must be installed and called (present at the top of run_analysis.R file).
run_analysis() uses the following order of operations -

* Creates a one column data frame out of "subject_test.txt" from the "test" folder signifying a set of subjects
* Creates a one column data frame out of "y_test.txt" from the "test" folder signifying a set of activities
* Renames each activity number with the proper activity label as defined in "activity_labels.txt"
* Creates a data frame for all measurement values in "X_test.txt" from the "test" folder
* Cbinds these three separate data frames to match all subjects, activities, and resultant measurements
* Steps 1 through 4 are repeated for the "train" folder
* The cbinded data frames created in steps 5 and 6 are rbinded to create one data frame
* All columns not corresponding to mean or std values are filtered out using "features.txt" as a reference
* All remaining columns are relabeled using as prescribed by "features.txt"
* A new data frame is created which outputs the mean of each measurement for each subject/activity pair
* A new file called "tidy_data_wearables.txt" is then created from this data frame using write.table()
