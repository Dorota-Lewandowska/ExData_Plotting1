### Load the data (unzipped txt file) -  make sure that unzipped file is available in your working directory:

data <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data$Date = NULL
data$Time = NULL

##Create a data file

data_trimmed <- subset(data,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))


###4th plot

png("plot4.png", width = 480, height = 480)


par(mfrow=c(2,2))
plot(x=(data_trimmed$DateTime),y=data_trimmed$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(x=(data_trimmed$DateTime),y=data_trimmed$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(x=(data_trimmed$DateTime),y=data_trimmed$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(data_trimmed$DateTime),y=data_trimmed$Sub_metering_2,col="red")
lines(x=(data_trimmed$DateTime),y=data_trimmed$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=1,cex=0.3)
plot(data_trimmed$DateTime, data_trimmed$Global_reactive_power, type = "l", main = "", xlab = "datetime")
dev.off()