# This function will read data from the training and text files. It will then merge them all together. It will then
# return a tidy version of the data.

# Lloyd Narciso - 12/2/2016

run_analysis<-function() {
    
    # install libraries for user just in case user doesn't have libraries installed
    library(dplyr)
    library(reshape2)
    
    # read training and testing data from several text files
    X_train<-read.table("train/X_train.txt")
    Y_train<-read.table("train/y_train.txt")
    subject_train<-read.table("train/subject_train.txt")
    X_test<-read.table("test/X_test.txt")
    Y_test<-read.table("test/y_test.txt")
    subject_test<-read.table("test/subject_test.txt")
    features<-read.table("features.txt")
    activity_labels<-read.table("activity_labels.txt")
    
    # combine training and testing files
    X_Set<-rbind(X_train,X_test)
    Y_Set<-rbind(Y_train,Y_test)
    subject_Set<-rbind(subject_train,subject_test)
    
    # rename columns
    names(features)<-c("row","label")
    names(activity_labels)<-c("row","label")
    names(X_Set)<-features$label
    names(Y_Set)<-"activity"
    names(subject_Set)<-"subject"
    
    # extract mean and std data from the X Set
    X_Set<-X_Set[union(grep("mean",names(X_Set)),grep("std",names(X_Set)))]
    
    # rename activities in Y Set from integer to action
    Y_Set$activity<-activity_labels[Y_Set$activity,]$label
    
    # combine X Set, Y Set and subject Set; rename columns to tidier names
    dataSet<-cbind(subject_Set,Y_Set,X_Set)
    names(dataSet)<-gsub("\\(\\)","",names(dataSet))
    names(dataSet)<-gsub("-mean","Mean",names(dataSet))
    names(dataSet)<-gsub("-std","Std",names(dataSet))
    names(dataSet)<-gsub("-","",names(dataSet))
    
    # average all the measurements by each subject and each activity; tidy up data
    dataSetAverageByGroup<-group_by(dataSet,subject,activity) %>%
        summarize_each(funs(mean)) %>%
        melt(id=c("subject","activity"),value.name="average")
    
    names(dataSetAverageByGroup)[match("variable",names(dataSetAverageByGroup))]<-"measurement"
    
    write.table(finalDataSet,"dataset.txt",row.names=FALSE)
}