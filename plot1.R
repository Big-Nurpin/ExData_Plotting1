##Histogram of Global Active Power frequency

##Download and unzip the data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold
              _power_consumption.zip", destfile = "data.zip")
unzip("data.zip")

##Read data into a table then subset into the two days
powerData <- read.table("household_power_consumption.txt", 
                        sep = ";", header = T)
powerData <- powerData[66637:69516, ]
##Convert data from character to numeric
powerData[, 3:9] <- apply(powerData[, 3:9], 2, function(x) as.numeric(x))

##Create histogram and export in a png
hist(powerData$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
