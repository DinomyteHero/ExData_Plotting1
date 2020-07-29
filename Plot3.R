library(ggplot2)
library(lubridate)
#Load the Data
mydata <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep = ";")
#Convert the Time and Date to their respective classes
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)
#Create the subset for the days in question
dataforday <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")
#Combine the Date and Time values
dataforday$Time <- with(dataforday, Date + Time)
#Converted the characters into numeric values
dataforday$Sub_metering_1 <- as.numeric(dataforday$Sub_metering_1)
dataforday$Sub_metering_2 <- as.numeric(dataforday$Sub_metering_2)
dataforday$Sub_metering_3 <- as.numeric(dataforday$Sub_metering_3)
#Save the plot created as an png file
png("Plot3.png", width = 480, height = 480)
plot(dataforday$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dataforday$Sub_metering_2, col = "red", type = "l")
lines(dataforday$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()