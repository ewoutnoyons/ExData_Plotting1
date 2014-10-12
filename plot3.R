## set your working directory to point to household electric power consumption data set

## read data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset on 1st and 2nd of February, 2007
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## combine date and time and convert to date format
Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(Datetime, "%d/%m/%Y %H:%M:%S")

## launch graphics device
png(filename = "plot3.png", bg = "transparent")

## create empty plot
plot(data$Datetime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")

## add line for each sub metering measure
lines(data$Datetime, data$Sub_metering_1, type = "l")
lines(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")

## add legend
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

## close graphics device
dev.off()