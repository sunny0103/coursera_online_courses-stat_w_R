url<-'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip'
download.file(url,destfile = 'JHU_project.zip')
unzip('JHU_project.zip',exdir='JHU_project')
data<-read.csv('JHU_project/activity.csv',na.strings = "NA")

dim(data)
str(data)

# What is mean total number of steps taken per day?
# Calculate the total number of steps taken per day
# Make a histogram of the total number of steps taken each day
# Calculate and report the mean and median of the total number 
# of steps taken per day

totpd<-data%>%group_by(date)%>%summarise(total=sum(steps,na.rm = TRUE))
ggplot(data=totpd,aes(total))+
  geom_histogram(binwidth = 300,color="blue")+
  labs(x='Total steps',y='frequency bidwith 300',title='Total steps per day')

meantotpd<-mean(totpd$total,na.rm = TRUE)
mediantotpd<-median(totpd$total,na.rm = TRUE)

# What is the average daily activity pattern?
avgpd<-data%>%group_by(interval)%>%summarise(avg=mean(steps,na.rm=TRUE))
ggplot(avgpd,aes(x=interval,y=avg))+geom_line(color="blue")+
  labs(x='5 min interval all days',y='average number of steps')+
  ggtitle('Average number of steps, 5 min interval')

avgpd[which.max(avgpd$avg),]

# Calculate and report the total number of missing values in the dataset

sum(is.na(data))

# Devise a strategy for filling in all of the missing values 
# in the dataset. The strategy does not need to be sophisticated. 
# For example, you could use the mean/median for that day, 
#or the mean for that 5-minute interval, etc

newdata<-data%>%group_by(interval)%>%
  mutate(steps=ifelse(is.na(steps),mean(steps,na.rm =TRUE),steps))

ndf<-newdata%>%group_by(date)%>%summarise(total=sum(steps))

ggplot(data=ndf,aes(total))+geom_histogram(color="blue")+
  labs(x='Total steps per day',title ='Total steps per day, mean replace of NA')

meanndf<-mean(ndf$total)
medianndf<-median(ndf$total)

grap<-data.frame(mean=c(meantotpd,meanndf),median=c(mediantotpd,medianndf))
rownames(grap)<-c('with NA','replacing by mean')
grap

#Are there differences in activity patterns between weekdays and weekends?

addwks<-newdata
addwks$dow<-weekdays(as.Date(addwks$date))
addwks$dow<-ifelse(addwks$dow=='Saturday'|addwks$dow=='Sunday','weekends','weekdays')
addwks$dow<-as.factor(addwks$dow)

newadd<-addwks%>%group_by(interval,dow)%>%summarise(avg=mean(steps))

ggplot(newadd,aes(interval,avg,color=dow))+geom_line()+facet_grid(dow~.)+
  labs(x='Interval',y='Average number of steps')+
  ggtitle("Average number of steps, weekdays vs weekends")


