Database <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Database <- Database[Database [,1] == "1/2/2007" | Database [,1] == "2/2/2007",]
Database$Global_active_power <- as.numeric(Database$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist (Database$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off ()