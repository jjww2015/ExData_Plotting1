##load package and subset the data from raw txt file
library(data.table)
#library(lubridate)

tmp <-fread("household_power_consumption.txt", sep=";", na.strings = "?")
tmp$Date <- as.Date(strptime(tmp$Date, "%d/%m/%Y"))
mydata <- filter(tmp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

##plot the history of "Global Active Power"
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(mydata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
