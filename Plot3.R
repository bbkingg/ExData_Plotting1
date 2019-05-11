setwd("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)")
library(data.table)
data=fread("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)/household_power_consumption.txt")
count=c(which(data$Date%in%"1/2/2007"),which(data$Date%in%"2/2/2007"))
data_proj=data[count]

# plotting the submeltering graph
# converting to posixlt
date=strptime(paste(data_proj$Date,data_proj$Time), "%d/%m/%Y %H:%M:%S")

#open png file
png("plot3.png")
# plot the graph
par("mar"=c(4,4,2,2))

par("mfrow"=c(1,1))
plot(date,data_proj$Sub_metering_1,type = "l",ylab = "Energy sub Metering",col="black")
lines(date,data_proj$Sub_metering_2,type = "l",,col="red")
lines(date,data_proj$Sub_metering_3,type = "l",,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"), lty=1, lwd=2.5,,col=c("black","red","blue"))

# close the file
dev.off()
