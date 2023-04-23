Database <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Database <- Database[Database [,1] == "1/2/2007" | Database [,1] == "2/2/2007",]
Database$Global_active_power <- as.numeric(Database$Global_active_power)
Database$Global_reactive_power <- as.numeric(Database$Global_reactive_power)
String <- paste (Database$Date, Database$Time)
DataTime <- strptime (String,"%d/%m/%Y %H:%M")
png("plot4.png", width = 480, height = 480)
par (mfrow = c (2,2))
plot (DataTime, Database$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)" , xlab = "")
plot (DataTime, Database$Voltage, type="l", ylab = "Voltage" , xlab = "datetime")
plot (DataTime, Database$Sub_metering_1, type = "n", ylab = "Energy sub metering" , xlab = "")
points (DataTime, Database$Sub_metering_1, col = "black", type ="l")
points (DataTime, Database$Sub_metering_2, col = "red", type ="l")
points (DataTime, Database$Sub_metering_3, col = "blue", type ="l")
legend ("topright", legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c ("black", "red", "blue"), y.intersp=1.1, box.col = "white")
plot (DataTime, Database$Global_reactive_power, type="l" ,ylab = "Global_reactive_power", xlab = "datetime")
dev.off ()






