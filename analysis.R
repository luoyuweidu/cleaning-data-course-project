#open the required packages;load activity and features table into R
require("reshape2")
require("data.table")
activity_labels=read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features=read.table("./UCI HAR Dataset/features.txt")[,2]

#load X_test,y_test, and subject_test file in test folder, wchih correspond to data collected from accelerometers, under which activity the data were collected, and the subject #
X_test=read.table("./UCI HAR Dataset/test/X_test.txt")
y_test=read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test=read.table("./UCI HAR Dataset/test/subject_test.txt")

#change the column names of X_test
names(X_test) = features
#Extract only the measurements on the mean and SD for each measurement.
extract=features[grepl("mean|std",features)]
X_test=subset(X_test,select=as.character(extract))

#match number in y_test with activities
y_test[,2]=activity_labels[y_test[,1]]
names(subject_test)="subject"
names(y_test)=c("activityid","activity")

#combine three files together
test=cbind(as.data.table(subject_test),y_test,X_test)

#process data in train folder in a similar way
X_train=read.table("./UCI HAR Dataset/train/X_train.txt")
y_train=read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train=read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train)=features
X_train=subset(X_train,select=as.character(extract))

y_train[,2]=activity_labels[y_train[,1]]
names(subject_train)="subject"
names(y_train)=c("activityid","activity")
train=cbind(as.data.table(subject_train),y_train,X_train)

#combine train data and test data
data=rbind(test,train)

#create new data data
id=c("subject","activityid","activity")
mersure=colnames(data)[4:82]
meltdata=melt(data,id=id,measure.vars = mersure)
tidydata=dcast(meltdata,subject+activity~variable,mean)

write.table(data,file="./data_merged.txt",row.names = F)
write.table(tidydata,file = "./tidydata.txt",row.names = F)
