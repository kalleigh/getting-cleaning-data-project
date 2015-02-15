# getting-cleaning-data-project
Repo for submitting project work from Getting and Cleaning Data Chapter


# Instructions on how the script works: 
The script has 5 working parts to it. 
* Loading the data from text files into R
* Creating 1 data set of all the provided data and labeling the columns appropriately
* Extracting the mean and standard deviation variables for each measurement
* Providing descriptive names for each activity
* Calculating the average of each measurement for each activity and each subject

As seen in swirl tutorial, it is always good to load the packages you will need for the code to run. I'm loading the dplyr package because I'll be using its components a lot in this script. 

###### Loading data into R: 
* Make sure that the UCI HAR Dataset has been loaded into the working diretory. 
* The files in the UCI HAR Dataset are .txt files. 
* The files needed for this project are in three groups: 
  * Train files - X_Train has the actual feature data for the 561 measurements, y_train has the corresponding activity data,   subject_train has the corresponding subject data
  * Test files - Same data like Train files, except these are called test
  * Features - These are the names of the 561 measurements. 
* Read these files into R using read.table() function and store them in meaningful variables. 
* The features.txt, when read into R, will be stored with 2 columns, only the 2nd column has the actual feature names. 
  * First, select only the 2nd column and then transpose the rows into columns so these can be used as column names for the train and test data that we will bind later. 
  
###### Binding Rows and Columns: 
*


