data<- read.table("data.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# subsetting the data on the two selected days 
subset_data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# changing the class of Date  
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")

# combining the date and time variable 
subset_data$mytime <- as.POSIXct(paste(subset_data$Date, subset_data$Time))

png("plot4.png",width=480,height = 480)
par(mfrow=c(2,2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(subset_data$mytime,subset_data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(subset_data$mytime,subset_data$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(subset_data$mytime,subset_data$Sub_metering_1,type="l", xlab="",ylab= "Energy sub metering",col="black")
points(subset_data$mytime,subset_data$Sub_metering_2,type="l",col="red")
points(subset_data$mytime,subset_data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
plot(subset_data$mytime,subset_data$Global_reactive_power,type="l",ylab="Global_reactive_Power",xlab="datetime")
dev.off()
