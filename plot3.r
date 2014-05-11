## Read file
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
table <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

# Set Weekdays
table$DateTime <- strptime(paste(table$Date, table$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(table$DateTime, table$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(table$DateTime, table$Sub_metering_2, type="l", col="red")
lines(table$DateTime, table$Sub_metering_3, type="l", col="blue")

## Add Legend
legend("topright", lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","blue","red"))

dev.off()
