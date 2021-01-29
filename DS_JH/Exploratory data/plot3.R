url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url,destfile = 'explo1.zip')
unzip('explo1.zip', exdir = 'explo1')
library(data.table)
#load data 
data<-fread('./explo1/household_power_consumption.txt', header = TRUE,sep=';', na.strings="?")

# change the as.date
data$datetime<-as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
str(data)
# subset the data from 2007-02-01 to 2007-02-02
df<-data[((datetime>='2007-02-01')&(datetime<'2007-02-03')),]
plot(x=df$datetime,y=df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(x=df$datetime,y=df$Sub_metering_2,col="red")
lines(x=df$datetime,y=df$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1)

dev.copy(png,file='plot3.png',width=480,height=480)
dev.off()
