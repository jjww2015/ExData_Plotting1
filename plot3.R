##load package and subset the data from raw txt file
library(data.table)

tmp <-fread("household_power_consumption.txt", sep=";", na.strings = "?")
tmp$Date <- as.Date(strptime(tmp$Date, "%d/%m/%Y"))
mydata <- filter(tmp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S", tz = "")

##plot the time series of "Energy sub metering" as a function of week day
png(filename = "plot3.png",width = 480, height = 480, units = "px")
with(mydata, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering",col = "black"))
with(mydata, lines(datetime, Sub_metering_2, col = "red"))
with(mydata, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c("solid", "solid", "solid"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
