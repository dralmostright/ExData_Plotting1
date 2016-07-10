###########################################################
# Question No.4 Source Code File						              #
###########################################################

## Load the data from text file to memory
data <- read.table('/R/workspace/household_power_consumption.txt',header = TRUE, sep = ";" ,na.strings = "?", stringsAsFactors= TRUE)

## subset the data in memory
subdata <- subset(data, as.Date(Date, format = "%d/%m/%Y") >=  as.Date("1/2/2007", format = "%d/%m/%Y") & as.Date(Date, format = "%d/%m/%Y") < as.Date("3/2/2007", format = "%d/%m/%Y"))

## Declare the vectors for color and meter 
meter <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
color <- c("black", "red", "blue")

## Merge the data and time
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Direct the graphics device to png image
png("plot4.png", width=480, height=480, bg="transparent")

## Set the canvas into 2x2 prats
par(mfrow=c(2,2))

## Configuration of Parameter and code to set plot [1][1]
##
## Explictly coerce data to numeric class
globalAP <- as.numeric(subdata$Global_active_power)

## Start the plot and set respective parameters 
plot(datetime, globalAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Configuration of Parameter and code to set plot [1][2]
##
voltage <- as.numeric(subdata$Voltage)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Configuration of Parameter and code to set plot [2][1]
##
## Declare the vectors for color and meter 
meter <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
color <- c("black", "red", "blue")

## Explictly coerce data to numeric class
subM1 <- as.numeric(subdata$Sub_metering_1)
subM2 <- as.numeric(subdata$Sub_metering_2)
subM3 <- as.numeric(subdata$Sub_metering_3)

## Start the plot and set respective parameters 
plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="", col= color[1])

## Annotate the plot for next meter readings
lines(datetime, subM2, type="l", col= color[2])
lines(datetime, subM3, type="l", col= color[3])

## Annotate the legends to the plot and off the redirection of output.
legend("topright", meter, lty=1, lwd=2.5, col=color)

globalRP <- as.numeric(subdata$Global_reactive_power)
plot(datetime, globalRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
