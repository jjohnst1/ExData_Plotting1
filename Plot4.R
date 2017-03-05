mydata <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(mydata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
submydata <- subset(mydata, mydata$Date=="1/2/2007" | mydata$Date=="2/2/2007")
date_time <- strptime(paste(submydata$Date,submydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower3 <- as.numeric(submydata$Global_active_power)
subMetering1 <- as.numeric(submydata$Sub_metering_1)
subMetering2 <- as.numeric(submydata$Sub_metering_2)
subMetering3 <- as.numeric(submydata$Sub_metering_3)
GlobalReactivePower <- as.numeric(submydata$Global_reactive_power)
voltage <- as.numeric(submydata$Voltage)
par(mfrow = c(2, 2))
plot(date_time, GlobalActivePower3, type = "l", xlab = "", ylab = "Global Active Power", cex=0.2)

plot(date_time, voltage, type = "l", xlab = "DateTime", ylab = "Voltage")

plot(date_time, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(date_time, subMetering2, type = "l", col="red")
lines(date_time, subMetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(date_time, GlobalActivePower3, type = "l", xlab = "", ylab = "Global Active Power", cex=0.2)

plot(date_time, voltage, type = "l", xlab = "DateTime", ylab = "Voltage")

plot(date_time, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(date_time, subMetering2, type = "l", col="red")
lines(date_time, subMetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

