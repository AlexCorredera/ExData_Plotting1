# Exploratory Data Analysis First Assignment
# Plot 3

# Read subset of UCI data into R (subsetting on the two days in February to be analysed)
data <- subset(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")

# Create solidified datetime variable
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Open PNG device
png(filename = "plot3.png", width = 480, height = 480)

# Create the plot
plot(data$Date_Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)))
lines(data$Date_Time, data$Sub_metering_2, col = "red")
lines(data$Date_Time, data$Sub_metering_3, col = "blue")
legend("topright", pch = 150, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close PNG device
dev.off()