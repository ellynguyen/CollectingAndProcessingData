Course Project Assignment for Getting and Cleaning Data by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

This documents will explain how all of the scripts work and how they are connected (refer script in run_analysis.R file)

Step 1: Combine 2 data sets of train and test into 1 data set
  - Load train data set from X_train.txt file with read.table() function, the file does not have header and the separate letter is a space ("")
  - Load test data set from X_test.text file with read.table() function, the file does not have header and the separate letter is a space ("")
  - Combine 2 data sets with merge() function and do not sort the result to keep the order intact, the tesing data is following the training data in the combined data set.

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
  - Load column name data set from features.txt file with read.table() function, the file does not have header and te separate letter is a space ("")
  - Name the columns/variables of the combined data set with the second column/variable's value of the column name data set
  - Get the list of column/variable names whose contain "-mean()" or "-std()" word from the column name data set, then subset the combined data set to get only these columns/variables. We have a subset data set here.

Step 3: Uses descriptive activity names to name the activities in the data set
  - Load training activity data set from y_train.txt file with read.table() function, the file does not have header and the separate letter is a space ("")
  - Load testing activity data set from y_test.txt file with read.table() function, the file does not have header and the separate letter is a space ("")
  - Combine all rows of testing activity data set into and following the training activity data set, the same order of traing and testing data arranged in the combined data set. This is important to keep this order so the activity names/labels can meet the actual activities at collecting time. We have all activity data set here.
  - Load activity lablel data set from activity_labels.txt file with read.table(), the file does not have a header and the separate sympol is a space (""). Then use the join() function of the plyr package to join the activity data set with this activity label data set so that all activities have corresponding activity labels. We hare all activity name data set here. The first column of this data set is the order number of rows, the second column is the correcsponding activity name/label.
  - Create a new variable/column named "activity_name" on the subset data set which contents the activity name/label of the corresponding row, which is the second column of the all activity name data set.

Step 4: Appropriately labels the data set with descriptive variable names
  - This is actually done on step 2

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
  - Load traing subject data set from subject_train.txt file, the file does not have a header and the separate sympol is a space ("")
  - Load testing subject data set from subject_test.txt file, the file does not have a header and the separate sympol is a space ("")
  - Combine all row of the testing subject data set into the training subject data set with rbind() function, we have all subject data set here. It is crucial to keep the order number of row intact, the same with the order number of row of the combined data set in the step 1.
  - Create a new variable/column named "subject" on the subset data set which contents data from the first column of the all subject data set
  - Use melt() function of the reshape2 package to melt all variable as measured data except "subject" and "activity_name" variables from the subset data set. We have a melted data set here. Each measured variable will be in one row/value of the "variable" column, and the corresponding value of each measured variable will be in one row of the "value" column. These 2 columns are just created in the melt() function which bring the subset data set into a tall and skinny melted data set.
  - Use ddply of the plyr package to calculate the average/mean value of each variable from the melted data set.

Finally, we have the tidy data set shown in step5DS.txt file
  
