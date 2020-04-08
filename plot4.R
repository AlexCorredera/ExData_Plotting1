# Exploratory Data Analysis First Assignment
# Plot 4

# Read subset of UCI data into R (subsetting on the two days in February to be analysed)
data <- subset(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")

# Create solidified datetime variable
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Convert Global active power variable from character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Convert scale of Global active power variable from watts to kilowatts
data$Global_active_power <- data$Global_active_power/1000

# Open PNG device
png(filename = "plot4.png", width = 480, height = 480)

# Create the plot
par(mfrow = c(2, 2))
with(data, {
        plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot(Date_Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", ylim = c(0, max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3)))
        lines(Date_Time, Sub_metering_2, col = "red")
        lines(Date_Time, Sub_metering_3, col = "blue")
        legend("topright", pch = 150, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# Close PNG device
dev.off()