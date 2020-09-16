## Creates four line graphs of Global Active Power, Voltage, 
##Energy sub-metering, and Global Reactive Power; all as a function of time

##Download and unzip the data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold
              _power_consumption.zip", destfile = "data.zip")
unzip("data.zip")

##Read data into a table then subset into the two days
powerData <- read.table("household_power_consumption.txt", 
                        sep = ";", header = T)
powerData <- powerData[66637:69516, ]

##Turn off x-axis labels and uses 4 graphs on plot
par(xaxt = "n", mfrow = c(2, 2), mar = c(5.1, 4.1, 2, 2.1))

##Plot graphs
with(powerData, {
    plot(Global_active_power, xlab = "",                            #1st graph
         ylab = "Global Active Power", type = "l")
    par(xaxt = "s")                                   #Adds proper axis labels
    axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
    par(xaxt = "n")
    plot(Voltage, xlab = "datetime", ylab = "Voltage", type = "l")  #2nd graph
    par(xaxt = "s")
    axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    
    par(xaxt = "n")
    plot(Sub_metering_1, type = "l",                                #3rd graph
         xlab = "", ylab = "Energy sub metering")                   
    lines(Sub_metering_2, col = "red")
    lines(Sub_metering_3, col = "blue")
    par(xaxt = "s")
    axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
    legend("topright", legend = c("Sub metering 1", "Sub metering 2",
                                  "Sub metering 3"),
           col = c("black", "red","blue"), lty = 1)
    
    par(xaxt = "n")                                                 #4th graph
    plot(Global_reactive_power, xlab = "datetime", 
         ylab = "Global Reactive Power", type = "l")  
    par(xaxt = "s")
    axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
})

##Export to png file
dev.copy(png, file = "plot4.png")
dev.off()
