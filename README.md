
# Context #


The instructions for this project was:



-  the data for the project :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


- create one R script called run_analysis.R that does the following.

    a) Merges the training and the test sets to create one data set.

    b) Extracts only the measurements on the mean and standard deviation for each measurement.

    c) Uses descriptive activity names to name the activities in the data set

    d) Appropriately labels the data set with descriptive variable names.

    e) From the data set in step 4, creates a second, independent tidy data 
    set with the average of each variable for each activity and each subject.






# Overview #

 - This Reame.md describes the script run_analysis.R.
-  The codebook.md describes the specific details of variables, values, and units in the tidy data set.


So from the principles of tidying data (cf: the course of course ;-) and http://www.stat.wvu.edu/~jharner/courses/stat623/docs/tidy-dataJSS.pdf), i tried to apply (and not sapply !:-):

    Each column represents a variable or measure or characteristic.
    Each variable is in one column.
    Each observation of the variable is in a different row.

Another principle i try to applied is KISS (keep It Simple Stupid)
So for some operations i used simple R command instead of loading lot of library (except dplyr)


### A) The script run_analysis.R  produce two files: ###


	- fitdata.txt
	- fitdatatidy.txt


These files can be read with the following R commands restectively:
fitdata <- read.csv("fitdata.txt", sep="")
fitdatatidy <- read.csv("fitdatatidy.txt", sep="")




The fitdata.txt and fitdatatidy.txt files in this directory are a tidy subset of the data provided in the Human Activity Recognition Using Smartphones Data Set. The full source datas and description  are available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones # 

fitdata.txt includes the combined test and training data sets from the following files:

    UCI HAR Dataset/test/subject_test.txt
    UCI HAR Dataset/test/X_test.txt
    UCI HAR Dataset/test/y_test.txt
    UCI HAR Dataset/train/subject_train.txt
    UCI HAR Dataset/train/X_train.txt
    UCI HAR Dataset/train/y_train.txt



The fitdatatidy.txt file in this directory is the result of grouping and computing the mean for
each variable for each activity and each subject.

- The first tidy data set, fitdata is 10299 rows x 81 columns
- The final tidy data set, fitdatatidy is 180 rows x 81 columns.


### B) Description of run_analysis.R ###


Firts, run_analysis.R download the source file, unzip it in a directory ./datas (wihch it creates) , and from the the UCI Har Dataset directory  so created , imports  into R the differents files, and transforms them into a tidy data subset.

Then the script performs the following operations: 

    In a loop, read first the files from the training directory and merge them by column (cbind) in one dataframe, with columns subjects and activities firts, and the measures for the remaining colums.
    In a second loop, it does the same for the test files, in a second dataframe.
    It then merge the two dataframes in one, by rows, with rbind. Finaly, there is a dataframe with 563 columns including the subjects and activities columns and 10299 lines(observations)..
	After that, it mames approprietly the colums with the names in the features.txt
   
    Following is the selection of only the measurements off the mean and standard deviation for each measurement.   
	To do that, we use the subsetting of a dataset by a vector of columns numbers. This vector is obtained by selecting with grep, only the columns with a name containing mean or std.
    
    Using factor,and the activity_labels.text, we set descriptive activity names to name the activities in the data set.
       
    After that, we do some tyding on the columns names by:
        
		a) removing "-" and parentheses.
		b) removing "BodyBody"
		c) deleting mean and std at the end of the names, and replacing them at the begining
		To do dat, we are using grep and sub
    
        Use the dplyr select function to create a subset of the data that only includes columns that have ".mean." and ".std." in their column names.
        
   		Finaly, for the step 4, we use group_by and summarize_each functions, as seen in the course, from the dplyr package. 
   

