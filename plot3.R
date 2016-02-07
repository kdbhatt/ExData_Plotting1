#import the data in memory

#file <- file("household_power_consumption.txt")
#data<-read.table(text=grep("^[1,2]/2/2007",readLines(file), value=TRUE),col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",header=TRUE)


#Plot - 3

png("plot3.png",width=480,height=480)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with (data, {
  plot(data$Sub_metering_1 ~ data$Datetime, type = "l",ylab = "Energy Sub Metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = "Red")
  lines(Sub_metering_3 ~ Datetime, col = "Blue")
})
legend("topright",col=c("Black","Red","Blue"),lty=1,lwd=2,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
