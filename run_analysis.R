#Load dplyr package first
library(dplyr)

#Make sure that the unzipped UCI HAR Dataset is in your working directory
#Load all train, test and feature files into R. 
train_subject<-read.table("~/UCI HAR Dataset/train/subject_train.txt")
traindata<-read.table("~/UCI HAR Dataset/train/X_train.txt")
trainlabel<-read.table("~/UCI HAR Dataset/train/y_train.txt")
test_subject<-read.table("~/UCI HAR Dataset/test/subject_test.txt")
testdata<-read.table("~/UCI HAR Dataset/test/X_test.txt")
testlabel<-read.table("~/UCI HAR Dataset/test/y_test.txt")
featurename<-read.table("~/UCI HAR Dataset/features.txt")

#Features.txt has 2 variables, but you need just the second. 
featurename<-select(featurename, V2)

#Transpose rows into columns so you can use it as column names for the feature data
features<-t(featurename)

#To create 1 data set of all this data, follow these steps - It's not yet tidy!. 
#Make sure to follow the same order of binding rows and columns together.
#I've used test data first and then train data for all binding purposes:

#1: bind test data and train data and name the columns accordingly: 
mydata1<-rbind(testdata, traindata)
names(mydata1)<-features

#2: bind test label and train label and name the column activity
mylabel1<-rbind(testlabel, trainlabel)
names(mylabel1)<-"activity"

#3: bind test subjects and train subjects and name the column subject
mysubject<-rbind(test_subject, train_subject)
names(mysubject)<-"subject"

#4: bind all columns together: 
#mytidy1 is the data set that combines all training and test data. Answer to (1) part of assignment
mytidy1<-cbind(mysubject, mylabel1, mydata1)

#-------------------------------------------------------------------------------

#To extract only the mean and standard deviation for each measurement:
#1. #In the column names, we're only looking for strings that match the word 
#subject, activity, std or mean but without meanFreq
mytidy2<-mytidy1[, grepl("subject|activity|std|mean[^F]", colnames(mytidy1))]

#2. The columns names are hard to read and operate on. 
#Let's remove the hyphen (-) and then the ()
names(mytidy2)<-gsub("-", "", names(mytidy2)) # This will look for hyphens and replace with blank
names(mytidy2)<-gsub("\\(\\)", "", names(mytidy2)) #This will look for parenthesis and replace with blank
names(mytidy2)<-tolower(names(mytidy2)) #This will make all column names to lower case

#-------------------------------------------------------------------------------

#To name the activities with descriptive activity names instead of numbers
#Using mutate function in dplyr, substitute numbers with names of activities
mytidy2<-mutate(mytidy2, activity=gsub(1, "WALKING", mytidy2$activity))
mytidy2<-mutate(mytidy2, activity=gsub(2, "WALKING_UPSTAIRS", mytidy2$activity))
mytidy2<-mutate(mytidy2, activity=gsub(3, "WALKING_DOWNSTAIRS", mytidy2$activity))
mytidy2<-mutate(mytidy2, activity=gsub(4, "SITTING", mytidy2$activity))
mytidy2<-mutate(mytidy2, activity=gsub(5, "STANDING", mytidy2$activity))
mytidy2<-mutate(mytidy2, activity=gsub(6, "LAYING", mytidy2$activity))

#-------------------------------------------------------------------------------

#To create a new data set with the average of each variable for each activity and each subject
mydf<-mytidy2 #Copy over existing dataset to create new dataset and then perform operations on new data set. 
grouping<-group_by(mydf, subject, activity) #Create grouping per activity as well as per subject
#Using summarise_each function to calculate mean for tables with multiple columns
mydf<-summarise_each(grouping, funs(mean)) 
mydf
#-------------------------------------------------------------------------------
