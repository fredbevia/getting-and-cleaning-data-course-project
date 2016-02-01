# Code book#

The data set can be read into R with the following code:

These files can be read with the following R commands restectively:

fitdata <- read.csv("fitdata.txt", sep="")
fitdatatidy <- read.csv("fitdatatidy.txt", sep="")

# Overview #

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

**README.md** describes the data tidying and transforming made by the script run_analysis.R  to create fitdatatidy.txt.

So the tidy data set is a subset of data from the files above,(*.txt in theUCI HAR Dataset ) that includes only measurements on the mean and standard deviation for each measure. This reduces the data to 81 columns (79 feature variable measurements, plus the subject and activities columns). The size of the tidy data set was further reduced by averaging each variable for each activity and each subject. This resulted in 180 rows of data, with a unique combination of subject and activities values in each row.

# Data description #

The variables in this tidy data set are a subset of the variables described in the features_info.txt file in the original data set. features_info.txt provides a more in-depth overview of the original values and how they were calculated.


     subjects: a factor that identifies the participants.

        Values: integer from 1 to 30
		These values are from the subject_[train|test.txt] files
    activities: a factor that identifies the activities being performed

        Values: Walking, WalkingUpStairs, WalkingDownStairs, Sitting, Standing, Lying
        These values are from the  y_[train|test.txt] and the activity_labels.txt files		

    The feature variables below (#3 - #81) are each an average of the values collected for the test subject and activity specified in the data row. For each, the value is a numeric normalized and bounded within [-1, 1]

    
	MeantimeBodyAccY	 The mean of the body acceleration on the Y axis.
	MeantimeBodyAccZ	 The mean of the body acceleration on the Z axis.
	StandardtimeBodyAccX	 The standard deviation of the body acceleration on the X axis.
	StandardtimeBodyAccY	 The standard deviation of the body acceleration on the Y axis.
	StandardtimeBodyAccZ	 The standard deviation of the body acceleration on the Z axis.
	MeantimeGravityAccX	 The mean of the gravity acceleration on the X axis.
	MeantimeGravityAccY	 The mean of the gravity acceleration on the Y axis.
	MeantimeGravityAccZ	 The mean of the gravity acceleration on the Z axis.
	StandardtimeGravityAccX	 The standard deviation of the gravity acceleration on the X axis.
	StandardtimeGravityAccY	 The standard deviation of the gravity acceleration on the Y axis.
	StandardtimeGravityAccZ	 The standard deviation of the gravity acceleration on the Z axis.
	MeantimeBodyAccJerkX	 The mean of the body acceleration on the X axis derived in time to obtain Jerk signals.
	MeantimeBodyAccJerkY	 The mean of the body acceleration on the Y axis derived in time to obtain Jerk signals.
	MeantimeBodyAccJerkZ	 The mean of the body acceleration on the Z axis derived in time to obtain Jerk signals.
	StandardtimeBodyAccJerkX	 The standard deviation of the body acceleration on the X axis derived in time to obtain Jerk signals.
	StandardtimeBodyAccJerkY	 The standard deviation of the body acceleration on the Y axis derived in time to obtain Jerk signals.
	StandardtimeBodyAccJerkZ	 The standard deviation of the body acceleration on the Z axis derived in time to obtain Jerk signals.
	MeantimeBodyGyroX	 The mean of the body angular velocity on the X axis.
	MeantimeBodyGyroY	 The mean of the body angular velocity on the Y axis.
	MeantimeBodyGyroZ	 The mean of the body angular velocity on the Z axis.
	StandardtimeBodyGyroX	 The standard deviation of the body angular velocity on the X axis.
	StandardtimeBodyGyroY	 The standard deviation of the body angular velocity on the Y axis.
	StandardtimeBodyGyroZ	 The standard deviation of the body angular velocity on the Z axis.
	MeantimeBodyGyroJerkX	 The mean of the body angular velocity on the X axis derived in time to obtain Jerk signals.
	MeantimeBodyGyroJerkY	 The mean of the body angular velocity on the Y axis derived in time to obtain Jerk signals.
	MeantimeBodyGyroJerkZ	 The mean of the body angular velocity on the Z axis derived in time to obtain Jerk signals.
	StandardtimeBodyGyroJerkX	 The standard deviation of the body angular velocity on the X axis derived in time to obtain Jerk signals.
	StandardtimeBodyGyroJerkY	 The standard deviation of the body angular velocity on the Y axis derived in time to obtain Jerk signals.
	StandardtimeBodyGyroJerkZ	 The standard deviation of the body angular velocity on the Z axis derived in time to obtain Jerk signals.
	MeantimeBodyAccMag	 The mean of the body acceleration magnitude
	StandardtimeBodyAccMag	 Thestandard deviation  of the gravity acceleration magnitude.
	MeantimeGravityAccMag	 The mean of the body acceleration magnitude derived in time to obtain Jerk signals.
	StandardtimeGravityAccMag	 The standard deviation  of the angular velocity magnitude.
	MeantimeBodyAccJerkMag	 The mean of the angular velocity magnitude derived in time to obtain Jerk signals.
	StandardtimeBodyAccJerkMag	 The standard deviation  of the angular velocity magnitude derived in time to obtain Jerk signals.
	MeantimeBodyGyroMag	 The mean of the body angular velocity magnitude
	StandardtimeBodyGyroMag	 The Standard deviation of the body angular velocity magnitude
	MeantimeBodyGyroJerkMag	 The mean of the body angular velocity magnitude derived in time to obtain Jerk signals.
	StandardtimeBodyGyroJerkMag	 The Standard deviation of the body angular velocity magnitude derived in time to obtain Jerk signals.
	MeanfourrierBodyAccX	 The mean of the body acceleration on the X axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccY	 The mean of the body acceleration on the Y axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccZ	 The mean of the body acceleration on the Z axis with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccX	 The Standard deviation of the body acceleration on the X axis with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccY	 The Standard deviation of the body acceleration on the Y axis with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccZ	 The Standard deviation of the body acceleration on the Z axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccFreqX	 The mean of the body angular velocity on the X axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccFreqY	 The mean of the body angular velocity on the Y axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccFreqZ	 The mean of the body angular velocity on the Z axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccJerkX	 The mean of the body acceleration on the X axis derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccJerkY	 The mean of the body acceleration on the Y axis derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccJerkZ	 The mean of the body acceleration on the Z axis derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccJerkX	 The Standard deviation of the body acceleration on the X axis derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccJerkY	 The Standard deviation of the body acceleration on the Y axis derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccJerkZ	 The Standard deviation of the body acceleration on the Z axis derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccJerkFreqX	 The mean of the body acceleration on the X axis derived in Frequency to obtain Jerk signals with a Fast Fourier Transform (FFT) applied 
	MeanfourrierBodyAccJerkFreqY	 The mean of the body acceleration on the Y axis derived in Frequency to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccJerkFreqZ	 The mean of the body acceleration on the Z axis derived in Frequency to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroX	 The mean of the body angular velocity on the X axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroY	 The mean of the body angular velocity on the Y axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroZ	 The mean of the body angular velocity on the Z axis with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyGyroX	 The Standard deviation of the body angular velocity on the X axis with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyGyroY	 The Standard deviation of the body angular velocity on the Y axis with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyGyroZ	 The Standard deviation of the body angular velocity on the Z axis with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroFreqX	 The mean of the body angular velocity on the X axis derived in Frequency with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroFreqY	 The mean of the body angular velocity on the Y axisderived in Frequency with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroFreqZ	 The mean of the body angular velocity on the Z axis derived in Frequency  with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccMag	 The mean of the body acceleration magnitude with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccMag	 Themean  deviation  of the body acceleration magnitude derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccMagFreq	 The standard deviation  of the body acceleration magnitude derivedfrequency to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyAccJerkMag	 The mean of the angular velocity magnitude derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyAccJerkMag	 The standard deviation of the body acceleration magnitude derived in time to obtain Jerk signals.
	MeanfourrierBodyAccJerkMagFreq	 The mean of the body acceleration magnitude  derived in Frequency to obtain Jerk signals with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroMag	 The mean of the body angular velocity magnitude with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyGyroMag	 The Standard deviation of the body angular velocity magnitude with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroMagFreq	 The mean of the body angular velocity magnitude derived frequency with a Fast Fourier Transform (FFT) applied.
	MeanfourrierBodyGyroJerkMag	 The mean of the body angular velocity magnitude derived in time to obtain a jerk signal with a Fast Fourier Transform (FFT) applied.
	StandardfourrierBodyGyroJerkMag	 The Standard deviation of the body angular velocity magnitude derived in time to obtain Jerk signals with a Fast Fourier Transform (FFT) applied..
	MeanfourrierBodyGyroJerkMagFreq	 The Standard deviation of the body angular velocity magnitude derived in frequency to obtain Jerk signals with a Fast Fourier Transform (FFT) applied..
	


