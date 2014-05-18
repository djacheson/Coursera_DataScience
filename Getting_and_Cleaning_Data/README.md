##run_Analysis

###This script reads in data from the UCI HAR Dataset, combines training and test sets, extracts variables with means and sds, merges the subject and label names (i.e., activity types), and finally, outputs a tidy dataset of means over each of the variables organized by activity type

###The function "run_Analysis" is designed to be run from within the UCI HAR Dataset directory

###The following steps are taken.
1. features and labels (activity labels) are read into dataframes from features.txt and activity_levels.txt
2. All training and testing data for the X variables is read in to dataframes (X_train and X_test). Variable names are assigned according to the the feature names
3. The stringr library is used to create boolean (i.e., logical) vectors for feature names containing mean and std, and these are combined into one boolean to only extract columns with mean and std (mean_stdBool)
4. Subsets of the X variables are selected based on mean_stdBool
5. All training and testing data for the y variables are read in to dataframes (y_train and y_test), with variable named "Activity_Number"
6. Activity labels are added to the Y dataframes by merging with the labels according using "Activity_Number" as the key
7. Subject information for training and testing is read in to a dataframe, and called "subject"
8. Data frames are made for all training and testing data, combining subject, X and Y variables for each (e.g., cbind(subject_train, X_train, Y_train))
9. Training and testing data is combined into a big dataframe called data_Combined, and this is turned into a data.table
10. Tidy data is created using the data.table package, applying mean over all variables according to the combination of Subject and Activity_Label
11. Function returns the tidy dataset



