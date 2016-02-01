library(dplyr) 

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile = "Dataset.zip"
workdir = "./datas"
dest=paste(workdir,"/",zipfile, sep="")
dataset = "UCI HAR Dataset"
train="train"
test="test"
subject="subject_"
ext=".txt"
if (! dir.exists(workdir)) {dir.create(workdir)}
download.file(url, dest)
unzip(dest,exdir=workdir)
setwd(workdir)

# read features
features <- read.table("D:/Coursera/Getting and Cleaning Data/datas/UCI HAR Dataset/features.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
activity_labels <- read.table("D:/Coursera/Getting and Cleaning Data/datas/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)


# Merging the files of the train set by columns

file_list  <-list.files(paste(dataset,"/",train,sep=""),pattern="*.txt",include.dirs=FALSE,full.names = TRUE)
# reorder the file: subject, activities,features
file_list<-append(file_list,file_list[3] ,1)[-4] 
for (file in file_list){
       
  # if the merged dataset doesn't exist, create it
  if (!exists("fitdata")){
    fitdata <- read.table(file, quote="\"", comment.char="", stringsAsFactors=FALSE)
  } else {
   
  #the merged dataset does exist, append to it
  
    
    fitdata<-cbind(fitdata, read.table(file, quote="\"", comment.char="", stringsAsFactors=FALSE),stringsAsFactors = FALSE )
    
  }
 
}
# Merging the files of the tests set by columns

file_list  <-list.files(paste(dataset,"/",test,sep=""),pattern="*.txt",include.dirs=FALSE,full.names = TRUE)
# reorder the file: subject, activities,features
file_list<-append(file_list,file_list[3] ,1)[-4] 
for (file in file_list){
       
  # if the merged dataset doesn't exist, create it
  if (!exists("fitdatatest")){
    fitdatatest <- read.table(file, quote="\"", comment.char="", stringsAsFactors=FALSE)
  } else {
   
  #the merged dataset does exist, append to it
  
    
    fitdatatest<-cbind(fitdatatest, read.table(file, quote="\"", comment.char="", stringsAsFactors=FALSE),stringsAsFactors = FALSE )
    
  }
 
}

# merging the two dataset by rows
fitdata<-rbind(fitdata,fitdatatest)
rm(fitdatatest)

# naming the first two columns

names(fitdata)[1]<-"subjects"
names(fitdata)[2]<-"activities"    

# naming the other columns with the names in features.txt
#
l<-length(names(fitdata))
names(fitdata)[3:l]<-features$V2

# Extract only the means and standards colums, + the subject and activities
colmeanstd <-c(1,2,grep("mean|std",features$V2)+2)
fitdata<-fitdata[,colmeanstd]

# name the activities via factor
fitdata$activities<-factor(fitdata$activities,activity_labels$V1,activity_labels$V2)
fitdata$subjects<-as.factor(fitdata$subjects)
fitnames <- names(fitdata)
# Tidying Variables Names
fitnames<-gsub("\\(\\)|-", "", fitnames)
fitnames<-gsub("^f", "fourrier", fitnames)
fitnames<-gsub("^t", "time", fitnames)
fitnames<-gsub("BodyBody", "Body", fitnames)


wmean <-grep("mean", fitnames)
wstd <-grep("std", fitnames)


fitnames[wmean]<-sub("mean", "", fitnames[wmean])
fitnames[wmean]<-sub("^", "Mean", fitnames[wmean])

fitnames[wstd]<-sub("std", "", fitnames[wstd])
fitnames[wstd]<-sub("^", "Standard", fitnames[wstd])

names(fitdata)<-fitnames

head(fitdata)

write.table(fitdata , row.name=FALSE, file='./fitdata.txt')


#  Grouping by subject and activities and computing the mean for each thanks to the dplyr librarie
fitdatatidy <-group_by(fitdata,subjects,activities) %>% summarise_each(funs(mean))
head(fitdatatidy)
write.table(fitdatatidy , row.name=FALSE, file='./fitdatatidy.txt')
