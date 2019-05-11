
setwd("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)")
library(data.table)
data=fread("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)/household_power_consumption.txt")
count=c(which(data$Date%in%"1/2/2007"),which(data$Date%in%"2/2/2007"))
data_proj=data[count]

# plotting the submeltering graph
# converting to posixlt
date=strptime(paste(data_proj$Date,data_proj$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par("mar"=c(4,4,2,2))

par("mfrow"=c(2,2))
plot(date,data_proj$Global_active_power,type = "l",ylab = "Global Active Power")
plot(date,data_proj$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")
plot(date,data_proj$Sub_metering_1,type = "l",ylab = "Energy sub Metering",col="black")
lines(date,data_proj$Sub_metering_2,type = "l",,col="red")
lines(date,data_proj$Sub_metering_3,type = "l",,col="blue")
plot(date,data_proj$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")

dev.off()
