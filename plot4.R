## set your working directory to point to household electric power consumption data set

## read data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset on 1st and 2nd of February, 2007
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## combine date and time variables and convert to date format
Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(Datetime, "%d/%m/%Y %H:%M:%S")

## launch graphics device
png(filename = "plot4.png", bg = "transparent")

## generate canvas for 4 plots
par(mfrow = c(2, 2))

## add first plot
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## add second plot
plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## add third plot
plot(data$Datetime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_1, type = "l")
lines(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", cex = 1, lwd = 1, bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## add fourth plot
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## close graphics device
dev.off()