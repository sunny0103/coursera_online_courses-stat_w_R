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

par(mfrow=c(2,2))

#plot(1,1)
plot(x=df$datetime,y=df$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
#plot(1,2)
plot(x=df$datetime,y=df$Voltage,type="l",xlab="datetime",ylab="Global Active Power(kilowatts)")
#plot(2,1)
plot(x=df$datetime,y=df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(x=df$datetime,y=df$Sub_metering_2,col="red")
lines(x=df$datetime,y=df$Sub_metering_3,col="blue")
#legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,bty="n")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=.5)
#plot(2,2)
plot(x=df$datetime,y=df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
