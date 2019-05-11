setwd("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)")
library(data.table)
data=fread("/Users/berkinsolak/Desktop/R programming/Exploratoty Data Analysis(Course 4)/household_power_consumption.txt")
count=c(which(data$Date%in%"1/2/2007"),which(data$Date%in%"2/2/2007"))
data_proj=data[count]


# plotting the global active power histogram
# open png file
png("plot1.png")

# plot thte histogram
hist(as.numeric(data_proj$Global_active_power),col="red",main="Global Active Power",xlab = "Global Active power(kilowatts)")

# Close the file
dev.off()