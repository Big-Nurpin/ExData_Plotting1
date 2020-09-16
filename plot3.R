## Line graph showing the sub-metering energy in different colors

##Download and unzip the data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold
              _power_consumption.zip", destfile = "data.zip")
unzip("data.zip")

##Read data into a table then subset into the two days
powerData <- read.table("household_power_consumption.txt", 
                        sep = ";", header = T)
powerData <- powerData

##Convert data from character to numeric and time
powerData[, 3:9] <- apply(powerData[, 3:9], 2, function(x) as.numeric(x))
powerData[, 2] <- as.POSIXct(powerData[, 2], format = "%H:%M:%S")

##Plot Data
par(xaxt = "n")      #Turn off x-axis labels
with(powerData, {
    plot(Sub_metering_1, type = "l", 
         xlab = "", ylab = "Energy sub metering")
    lines(Sub_metering_2, col = "red")
    lines(Sub_metering_3, col = "blue")
})
##Add proper x-axis labels
par(xaxt = "s")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
##Add legend to the top-right
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                       "Sub_metering_3"),
       col = c("black", "red","blue"), lty = 1, cex = 1)

#Export graph to png file
dev.copy(png, file = "plot3.png")
dev.off()

