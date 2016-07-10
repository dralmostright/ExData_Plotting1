###########################################################
# Question No.1 Source Code File						              #
###########################################################

## Load the data from text file to memory
data <- read.table('household_power_consumption.txt',header = TRUE, sep = ";" ,na.strings = "?", stringsAsFactors= TRUE)

## subset the data
subdata <- subset(data, as.Date(Date, format = "%d/%m/%Y") >=  as.Date("1/2/2007", format = "%d/%m/%Y") & as.Date(Date, format = "%d/%m/%Y") < as.Date("3/2/2007", format = "%d/%m/%Y"))

## Explictly coerce data to numeric class
globalAP <- as.numeric(subdata$Global_active_power)

## Start the plot and set respective parameters 
png(file="plot1.png",width=480, height=480)
hist(globalAP, col='red', xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()