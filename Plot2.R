setwd("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)")
library(data.table)
data=fread("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)/household_power_consumption.txt")
count=c(which(data$Date%in%"1/2/2007"),which(data$Date%in%"2/2/2007"))
data_proj=data[count]

# converting to posixlt
date=strptime(paste(data_proj$Date,data_proj$Time), "%d/%m/%Y %H:%M:%S")

#open png file
png("plot2.png")
# plot the graph
plot(date,data_proj$Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)")
# close the file
dev.off()
