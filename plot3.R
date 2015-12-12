library(dplyr)
library(data.table)
library(lubridate)
setwd("~/ExData_Plotting1")

# Import txt file 

newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE)
newFile = mutate(newFile, DateTime = dmy(Date)+hms(Time), Date = dmy(Date))

# Select the correct dates

file = filter(newFile, Date==ymd("2007-02-01") | Date==ymd("2007-02-02"))

# Generate png

png("plot3.png", width=480,height=480,units='px')
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(x = file$DateTime, y = file$Sub_metering_1 , type = "l", xlab = "", ylab = "Energy sub meeting", col = lncol[1])
lines(x = file$DateTime, y = file$Sub_metering_2, col = lncol[2])
lines(x = file$DateTime, y = file$Sub_metering_3, col = lncol[3])
legend('topright', legend = lbls, lty = 'solid', col = lncol)
dev.off()
