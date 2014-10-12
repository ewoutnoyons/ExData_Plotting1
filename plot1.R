## set your working directory to point to household electric power consumption data set

## read data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## subset on 1st and 2nd of February, 2007
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]

## launch graphics device
png(filename = "plot1.png", bg = "transparent")

## plot histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## close graphics device
dev.off()