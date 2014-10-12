## set your working directory to point to household electric power consumption data set

## read data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset on 1st and 2nd of February, 2007
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## combine date and time and convert to date format
Datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(Datetime, "%d/%m/%Y %H:%M:%S")

## launch graphics device
png(filename = "plot2.png", bg = "transparent")

## create plot
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## close graphics device
dev.off()