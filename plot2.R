
## Read header for the table
header <- read.table('household_power_consumption.txt', nrows = 1, 
                     header = FALSE, sep =';', stringsAsFactors = FALSE)

## Create a table with values between 01/02/2007 - 02/02/2007
data<-read.table("household_power_consumption.txt", sep=";", 
                 nrows=2880, skip=66637)

## Add header to the table
colnames(data)<-unlist(header)

## Add column to table with datetime format
data$Date_time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Open PNG device
png(filename='plot2.png', width=480, height=480, units='px', bg="transparent")

## Plot data
plot(data$Date_time, data$Global_active_power, type="l", xlab=" ", 
     ylab="Global Active Power(kilowatts)")

## Close the PNG device
dev.off()