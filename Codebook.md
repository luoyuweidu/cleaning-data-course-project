#Codebook
This codebook describes the variables, the data, and any transformations or work that have beenperformed to clean up the data 

##Description of the data and variables
###Source

* Data set address:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Data set information:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Data set components
* README.txt : Overview information on experiment design and the meaning of each data set
* features.txt: Features of subjects; has 561 rows; correspond to colmuns of data we need to analyze
* features_information.txt: A description of feature variables
* activity_lables.txt: List six activities under which subject data were collected
* X_test.txt: Data collected from test experiment part
* y_test.txt: Under which activity each record was collected
* subject_test.txt: To which subject each record in X_test belongs
* X_train.txt: Data collected from train experiment part
* y_train.txt: Under which activity each record was collected
* subject_train.txt: To which subject each record in X_test belongs

There are other data available in this data package which I didn't use in analysis this time.

* body_acc_x_test.txt
* body_acc_y_test.txt
* body_acc_z_test.txt
* body_gyro_x_test.txt
* body_gyro_y_test.txt
* body_gyro_z_test.txt
* total_acc_x_test.txt
* total_acc_y_test.txt
* total_acc_z_test.txt

##Transformation

Transformation I did to original data set to get new data set

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
