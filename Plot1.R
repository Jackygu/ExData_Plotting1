##Read the file and select the date
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
table <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]

##Polt the PNG according to the requirement
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(table$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
