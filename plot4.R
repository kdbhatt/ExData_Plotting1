
#file <- file("household_power_consumption.txt")
#data<-read.table(text=grep("^[1,2]/2/2007",readLines(file), value=TRUE),col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",header=TRUE)


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plot - 4

png("plot4.png",width=480,height=480)

par(mfrow = c(2,2), mar = c(4,4,1,1),oma = c(0,0,1,0))
with (data, {
  plot(data$Global_active_power ~ data$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
  
  plot(data$Voltage ~ data$Datetime, type = "l",ylab = "Voltage", xlab = "datetime")
  
  plot(data$Sub_metering_1 ~ data$Datetime, type = "l",ylab = "Energy sub metering", xlab = "", col = "black")
  lines(Sub_metering_2 ~ Datetime, col = "Red")
  lines(Sub_metering_3 ~ Datetime, col = "Blue")
  legend("topright",lty=1,col = c("Black","Red","Blue"),bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.65)
  
  plot(data$Global_reactive_power ~ data$Datetime, type = "l",ylab = "Global_reactive_power", xlab = "dateime")
  
})

dev.off()







