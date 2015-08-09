
## Read header for the table
header <- read.table('household_power_consumption.txt', nrows = 1, 
                     header = FALSE, sep =';', stringsAsFactors = FALSE)

## Create a table with values between 01/02/2007 - 02/02/2007
data<-read.table("household_power_consumption.txt", sep=";", 
                 nrows=2880, skip=66637)

## Add header to the table
colnames(data)<-unlist(header)

## Open PNG device
png(filename='plot1.png', width=480, height=480, units='px', bg="transparent")

## Create histogram
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

## Close the PNG device
dev.off()