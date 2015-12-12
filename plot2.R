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

png("plot2.png",width=480,height=480,units='px')
plot(x = file$DateTime, y = file$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
