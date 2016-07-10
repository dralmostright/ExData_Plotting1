###########################################################
# Question No.2 Source Code File						  #
###########################################################

## Load the data from text file to memory
data <- read.table('/R/workspace/household_power_consumption.txt',header = TRUE, sep = ";" ,na.strings = "?", stringsAsFactors= TRUE)

## subset the data
subdata <- subset(data, as.Date(Date, format = "%d/%m/%Y") >=  as.Date("1/2/2007", format = "%d/%m/%Y") & as.Date(Date, format = "%d/%m/%Y") < as.Date("3/2/2007", format = "%d/%m/%Y"))

## Merge the data and time
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Explictly coerce data to numeric class
globalAP <- as.numeric(subdata$Global_active_power)

## Start the plot and set respective parameters 
png("plot2.png", width=480, height=480, bg="transparent")
plot(datetime, globalAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
