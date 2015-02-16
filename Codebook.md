#Codebook for Getting and Cleaning Data Course Project: 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset consists of data collected through experiments carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using the script run_analysis.R also available in this Github folder, the dataset mydf can be created. Variable and observation details on the mydf dataset are as follows: 

<b>subject</b>
      Participants in the experiment
      range 1-30 
      
<b>label</b>
      Activities performed by each participant. Each subject performed six activities
      * LAYING
      * SITTING
      * STANDING
      * WALKING
      * WALKING_UPSTAIRS
      * WALKING_DOWNSTAIRS
      
The next 66 variables are calculated variables. Each variable represents either the time and the frequency domain signal of the measurement for each pattern in the X, Y and Z directions. 

      * A time domain signal is prefixed with t. 
      * A frequency domain signal is prefixed with f. 

The set of variables that were estimated from these signals are: 

      * mean(): Mean value
      * std(): Standard deviation

Each observation contains the average of of mean and standard deviation values for each activity and for each participant in the experiment. 

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

1. Total number of observations = <b> 180 </b>
2. Total number of variables (columns) = <b> 68 </b>
