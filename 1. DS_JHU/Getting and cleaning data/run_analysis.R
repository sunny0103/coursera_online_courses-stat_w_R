library(dplyr)
# get the data
if (!file.exists("data")){
  dir.create("data")
}
url='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url,destfile = 'getcldataproject.zip')
unzip('getcldataproject.zip',exdir = 'getcldataproject')

#### 1.Merges the training and the test sets to create one data set#########
# read test data set
xtest<-read.table('getcldataproject/UCI HAR Dataset/test/X_test.txt')
ytest<-read.table('getcldataproject/UCI HAR Dataset/test/y_test.txt')
subtest<-read.table('getcldataproject/UCI HAR Dataset/test/subject_test.txt')
# read train data set
xtrain<-read.table('getcldataproject/UCI HAR Dataset/train/X_train.txt')
ytrain<-read.table('getcldataproject/UCI HAR Dataset/train/y_train.txt')
subtrain<-read.table('getcldataproject/UCI HAR Dataset/train/subject_train.txt')
# feature 
feature<-read.table('getcldataproject/UCI HAR Dataset/features.txt')
# activity labels
actlabel<-read.table('getcldataproject/UCI HAR Dataset/activity_labels.txt')

colnames(xtest)<-feature[,2]
colnames(xtrain)<-feature[,2]
colnames(ytest)<-'activeid'
colnames(ytrain)<-'activeid'
colnames(subtest)<-'subid'
colnames(subtrain)<-'subid'
# bining each data set
test<-cbind(xtest,ytest,subtest)
train<-cbind(xtrain,ytrain,subtrain)
data<-rbind(test,train)
dim(data)
### 2.Extracts only the measurements on the mean and standard deviation for each measurement.###
msd<-grep('mean\\(\\)|std\\(\\)',colnames(data),value = TRUE)
msddata<-data%>%select(msd)
colnames(msddata)
### 3. Uses descriptive activity names to name the activities in the data set
colnames(msddata)<-gsub("^t","Time",colnames(msddata))
colnames(msddata)<-gsub("Acc","Acceleration",colnames(msddata))
colnames(msddata)<-gsub("Gyro","Gyroscope",colnames(msddata))
colnames(msddata)<-gsub("Mag","Magnitude",colnames(msddata))
colnames(msddata)<-gsub("^f","Frequency",colnames(msddata))

### 4.Appropriately labels the data set with descriptive variable names.
msddata<-cbind(msddata,data$activeid,data$subid)
names(msddata)[67]<-'Activitylevel'
names(msddata)[68]<-'Subject'
msddata$Activitylevel<-actlabel[msddata$Activitylevel,2]

###5. #From the data set in step 4, creates a second,
###independent tidy data set with the average of each variable for each activity and each subject.
seconddata<-msddata%>%group_by(Subject,Activitylevel)%>%summarise_all(funs(mean))
write.table(seconddata,file = "tidydata.txt",row.name=FALSE)


