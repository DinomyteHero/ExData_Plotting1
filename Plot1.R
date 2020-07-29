library(ggplot2)
library(lubridate)
#Read the data
mydata <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep = ";")
#Converted the Date column from Character class into Date class
mydata$Date <- dmy(mydata$Date)
#Created an new subset for the two days that is selected
dataforday <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")
#Created the histogram and saved it as an PNG
png("Plot1.png", width = 480, height = 480)
hist(as.numeric(dataforday$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

