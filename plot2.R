##load package and subset the data from raw txt file
library(dplyr)
library(data.table)

tmp <-fread("household_power_consumption.txt", sep=";", na.strings = "?")
tmp$Date <- as.Date(strptime(tmp$Date, "%d/%m/%Y"))
mydata <- filter(tmp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S", tz = "")

##plot the time series of "Global Active Power" as a function of week day
png(filename = "plot2.png",width = 480, height = 480, units = "px")
with(mydata, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()
