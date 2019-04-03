data<- read.table("data.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# subsetting the data on the two selected days 
subset_data<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

# changing the class of Date  
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")

# combining the date and time variable 
subset_data$mytime <- as.POSIXct(paste(subset_data$Date, subset_data$Time))


png("plot2.png", width=480, height= 480)
plot(subset_data$mytime, subset_data$Global_active_power, type= "l", ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()