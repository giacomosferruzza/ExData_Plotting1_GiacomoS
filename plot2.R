Database <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Database <- Database[Database [,1] == "1/2/2007" | Database [,1] == "2/2/2007",]
Database$Global_active_power <- as.numeric(Database$Global_active_power)
String <- paste (Database$Date, Database$Time)
DataTime <- strptime (String,"%d/%m/%Y %H:%M")
png("plot2.png", width = 480, height = 480)
plot (DataTime, Database$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off ()
