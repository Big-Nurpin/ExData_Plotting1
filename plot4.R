## Creates four line graphs of Global Active Power, Voltage, 
##Energy sub-metering, and Global Reactive Power; all as a function of time

##Download and unzip the data file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold
              _power_consumption.zip", destfile = "data.zip")
unzip("data.zip")