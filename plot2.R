# Exploratory Data Analysis First Assignment
# Plot 2

# Read subset of UCI data into R (subsetting on the two days in February to be analysed)
data <- subset(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")

# Create solidified datetime variable
data$Date_Time <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Convert Global active power variable from character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Convert scale of Global active power variable from watts to kilowatts
data$Global_active_power <- data$Global_active_power/1000

# Open PNG device
png(filename = "plot2.png", width = 480, height = 480)

# Create the plot
plot(data$Date_Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close PNG device
dev.off()