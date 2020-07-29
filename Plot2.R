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
#Save the plot created as an png file
png("Plot2.png", width = 480, height = 480)
plot(dataforday$Time,as.numeric(dataforday$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
