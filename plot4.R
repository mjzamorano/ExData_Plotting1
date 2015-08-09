
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
png(filename='plot4.png', width=480, height=480, units='px', bg="transparent")

## Labels for the legend
lbls <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
lcol <- c("black", "red", "blue")

## Create 4 plots in 2x2 format
par(mfrow=c(2,2), mar=c(4,4,2,1))

with(data, {
      
      ## Plot 1.1
      plot(Date_time, Global_active_power, type="l", xlab=" ", 
           ylab="Global Active Power")
      
      ## Plot 1.2
      plot(Date_time, Voltage, type="l", xlab="datetime", ylab="Voltage")
      
      ## Plot 2.1
      plot(Date_time, Sub_metering_1, type="n", ylab="Energy sub metering",
           xlab=" ")
      lines(Date_time, Sub_metering_1, col=lcol[1])
      lines(Date_time, Sub_metering_2, col=lcol[2])
      lines(Date_time, Sub_metering_3, col=lcol[3])
      legend("topright", legend=lbls, col=lcol, lty="solid", bty="n")
      
      ## Plot 2.2
      plot(Date_time, Global_reactive_power, type="l", xlab="datetime", 
           ylab="Global_reactive_power")
})

## Close the PNG device
dev.off()