## Read file
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
table <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

## Set Weekdays
table$DateTime <- strptime(paste(table$Date, table$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

## Set 2x2 plots
par(mfrow = c(2,2))

## Draw first plot

plot(table$DateTime, table$Global_active_power, xlab="", ylab="Global Active Power", type="l")

## Draw second plot

plot(table$DateTime, table$Voltage, xlab="datetime", ylab="Voltage", type="l")

## Draw third plot (same as plot3)

plot(table$DateTime, table$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(table$DateTime, table$Sub_metering_2, type="l", col="red")
lines(table$DateTime, table$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","blue","red"))

## Draw fourth plot

plot(table$DateTime, table$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")   

dev.off()
