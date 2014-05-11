data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
table <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

table$DateTime <- strptime(paste(table$Date, table$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(table$DateTime, table$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
