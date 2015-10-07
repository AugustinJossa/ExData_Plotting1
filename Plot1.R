#change working directory
setwd("~/Desktop/MOOC/Programming_assignment/Explore/TEST")

#required packages
library(data.table)
library(lubridate)
library(datasets)

#Download file
file.url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./power_consumption.zip"))
{download.file(file.url, destfile = "./power_consumption.zip", method="curl")}
unzip("power_consumption.zip", overwrite = TRUE)

#Read specified two columns
DT<- read.table(file = "household_power_consumption.txt", sep=";", colClasses = "character", header = TRUE, na.strings = "?",)
cols<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(DT)<- cols

DT2<- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007",]


#Cleaning data
DT2$DateTime<-dmy(DT2$Date)+hms(DT2$Time)        
DT2$Global_active_power<- as.numeric(DT2$Global_active_power)


#Plot 1
hist(DT2$Global_active_power, main= "Global Active Power", xlab=" Global Active Power (kilowatts)", col = "red",)
dev.copy(png, file = "Plot1.png", width=480, height=480, units="px")
dev.off()

