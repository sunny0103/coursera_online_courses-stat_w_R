url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url,destfile = 'explo1.zip')
unzip('explo1.zip', exdir = 'explo1')
library(data.table)
#load data 
data<-fread('household_power_consumption.txt', header = TRUE,sep=';', na.strings="?")

# change the as.date
data$datetime<-as.Date(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# subset the data from 2007-02-01 to 2007-02-02
df<-data[((datetime>='2007-02-01')&(datetime<='2007-02-02')),]

#plot the data
hist(df$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power",col="red")

# make a png plot file
dev.copy(png,file='plot1.png',width=480,height=480)
dev.off()
