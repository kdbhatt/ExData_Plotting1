#1. Download the file from: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#2. Extract file into the working folder
#3. Set working folder where data has been saved.


#Replace you working directory where "household_power_consumption.txt" file has been placed.


setwd("C:/Krishna/MyProject/DataScience/4_Exploratory_Data_Analysis") #change to working folder

#import the data in memory
file <- file("household_power_consumption.txt")
data<-read.table(text=grep("^[1,2]/2/2007",readLines(file), value=TRUE),col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",header=TRUE)


#Plot - 1

png("plot1.png",width=480,height=480)
hist(data$Global_active_power,main = "Global Active Power",col="red",xlab = "Global Active Power (Kilowatts)")

dev.off()