
#1. Merges the training and the test sets to create one data set.
trains <-read.table("./CollectingandProcessing/UCI Har Dataset/train/X_train.txt", header=F, sep="")
tests <-read.table("./CollectingandProcessing/UCI Har Dataset/test/X_test.txt", header=F, sep="")

comdt<-merge(trains, tests, all=T, sort=FALSE)

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
cnames<-read.table("./CollectingandProcessing/UCI Har Dataset/features.txt", header=F, sep="")
colnames(comdt) <- cnames$V2
library(data.table)
lcolumns <-cnames$V2[cnames$V2 %like% "-mean()" | cnames$V2 %like% "-std()"]
subdt<-subset(comdt,, select =lcolumns)

#3. Uses descriptive activity names to name the activities in the data set
trainacti<-read.table("./CollectingandProcessing/UCI Har Dataset/train/y_train.txt", header=F, sep="")
testacti<-read.table("./CollectingandProcessing/UCI Har Dataset/test/y_test.txt", header=F, sep="")
allacti<-rbind(trainacti,testacti)

actilabs <-read.table("./CollectingandProcessing/UCI Har Dataset/activity_labels.txt", header=F, sep="")
library(plyr)
actinames <-join(allacti, actilabs)
subdt$activity_name <-actinames$V2

#4. Appropriately labels the data set with descriptive variable names. 
  ####the data set has been set the variable names in step $2

#5. From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.

trainsubjects<-read.table("./CollectingandProcessing/UCI Har Dataset/train/subject_train.txt", header=F, sep="")
testsubjects<-read.table("./CollectingandProcessing/UCI Har Dataset/test/subject_test.txt", header=F, sep="")
subjects <- rbind(trainsubjects, testsubjects)
subdt$subject <-subjects$V1

library(reshape2)
melteddt<-melt(subdt, id=c("subject","activity_name"))

library(plyr)
resultdt<-ddply(melteddt, .(subject,activity_name, variable), summarize, mean=mean(value))
