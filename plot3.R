# plot3.R Assmuing "household_power_consumption.txt" is in the sample folder
## Determine number of lines to skip and number of rows to read
time1<-strptime("16/12/2006 17:24:00", "%d/%m/%Y %H:%M:%S")
time2 <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
time3 <- strptime("02/02/2007 23:59:00", "%d/%m/%Y %H:%M:%S")
minDiff1 <- difftime(time2,time1,units="mins")
minDiff2 <- difftime(time3,time2,units="mins")
nLineSkip = minDiff1
nRowsRead = minDiff2+1

## Read data
df <- read.table('./household_power_consumption.txt',na.strings = '?',sep=";",header = T,skip = nLineSkip,nrows = nRowsRead+1 )
colnames(df) <- c("Date","Time","Global_Active_Power","Global_Reactive_Power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Make plot2.png
timeVector <-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
# Open png device
png("plot3.png",width = 480,height = 480)
# Make plot
plot(timeVector,df$Sub_metering_1,type = 'l',ylab='Energy sub metering',xlab = '',col='black')
lines(timeVector,df$Sub_metering_2,ylab='Energy sub metering',xlab = '',col='red')
lines(timeVector,df$Sub_metering_3,ylab='Energy sub metering',xlab = '',col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()