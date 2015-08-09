
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

## Labels for the legend
lbls <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
lcol <- c("black", "red", "blue")

## Open PNG device
png(filename='plot3.png', width=480, height=480, units='px', bg="transparent")

## Plot data and legend
with(data, {
      plot(Date_time, Sub_metering_1, type="n", ylab="Energy sub metering",
           xlab=" ")
      lines(Date_time, Sub_metering_1, col=lcol[1])
      lines(Date_time, Sub_metering_2, col=lcol[2])
      lines(Date_time, Sub_metering_3, col=lcol[3])
      legend("topright", legend=lbls, col=lcol, lty="solid")
})

## Close the PNG device
dev.off()