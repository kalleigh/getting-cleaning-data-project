### Getting and Cleaning Data Course Project

This file consists of information that will help you through the various files and links you can find in this github folder. 

#### Script link: 
Run the run_analysis.R script in R
Script link: https://github.com/kalleigh/getting-cleaning-data-project/blob/master/run_analysis.R

####  How does the script work?  
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
* Because of the way we read files into R, train and test data are stored separately. These have to be bound together to create 1 dataset. 
* There are 3 separate sets of data to bind: Feature measurements, activity data and subject data. We will use row bind (rbind) for this. Follow the same order i.e., test data first followed by train data. 
* Once all the rows have been bound, use column bind to create 1 new data set that has all these separate sets of data bound together.
* This will result in a dataset having 10299 rows and 563 variables. 

###### Extracting mean and standard deviation measurements: 
* In the column names, we're only looking for strings that match the word #subject, activity, std or mean. Note that there are columns that have the string meanFreq in them, but we don't want that. Using grepl function helps us extract only mean and standard deviation. 
* Using this search string "subject|activity|std|mean[^F]" will extract any column names in the newly created data set that has the word subject or activity or std in it, as well as the word mean not followed by a capital F. 
* This extraction will result in a dataset having 10299 rows with 68 variables. 
* You'll see that the column names in this dataset don't necessarily conform to the tidy data set principles - they don't have a good format that can be used to run operations on. 
* The next few lines of code will remove the hyphens and the parenthesis and convert all characters to lower case. Using gsub function, this can be achieved. 

###### Providing descriptive names to activiities: 
* The activity labels in this semi-cleaned dataset are all numbers, not descriptive enough to conform to tidy data prinicples. 
* Using mutate function in the dplyr package, it is possible to substitite names for these numbers. 
* It is easiest to work through one activity type at a time, and substitute a name for each accordingly. 
* By using the gsub function within mutate, this can be achieved. 

###### Grouping and summarizing
* I've created a copy of the dataset to have a new dataset to start working on it. 
* Using group_by function in the dplyr package, create a grouping by subject and activity. 
* Use this grouping in the summarise_each function (again in the dplyr package) to call the mean function using funs(mean). 
* This will summarize the value of each measurement by subject and activity. 
* Finally, make sure to print this dataset to the screen. 

#### Reading mydf data to R: 
A text version of the mydf data has been provided to you named mytidydataset.txt. Assuming this file is in your working directory, you can use the following code to read the file into R. 
mytidydataset<-read.table("~/UCI HAR Dataset/mytidydataset.txt", header=T)

#### Codebook describing mytidydataset: 
Codebook link: https://github.com/kalleigh/getting-cleaning-data-project/blob/master/Codebook.md
