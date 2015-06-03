### Load the data (unzipped txt file) -  make sure that unzipped file is available in your working directory:

data <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
data$DateTime = paste(data$Date, data$Time)
data$DateTime = as.POSIXlt(data$DateTime,format="%d/%m/%Y %H:%M:%S")
data$Date = NULL
data$Time = NULL

##Create a data file

data_trimmed <- subset(data,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

###Create the 1st plot
png("plot1.png", width = 480, height = 480)
hist(data_trimmed$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()

