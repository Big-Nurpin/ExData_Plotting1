##Line graph of Global Active Power of the two days

##Download and unzip the data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold
              _power_consumption.zip", destfile = "data.zip")
unzip("data.zip")

##Read data into a table then subset into the two days
powerData <- read.table("household_power_consumption.txt", 
                        sep = ";", header = T)
powerData <- powerData[66637:69516, ]
##Convert data from character to numeric and time
powerData[, 3:9] <- apply(powerData[, 3:9], 2, function(x) as.numeric(x))
powerData[, 2] <- as.POSIXct(powerData[, 2], format = "%H:%M:%S")

##Plot Data
par(xaxt = "n")      #Turn off x-axis labels
with(powerData, {
    plot(Global_active_power, type = "l", xlab = "", 
    ylab = "Global Active Power (kilowatts)")
})
##Add proper x-axis labels
par(xaxt = "s")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, file = "plot2.png")
dev.off()

