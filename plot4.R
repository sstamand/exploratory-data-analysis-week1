data <- read.table("data_cleaned.csv", sep = ",", header = TRUE)

# Plot 4 (2x2 with plots 1 to 3 and line graph of global reactive power)
png(file = "plot4.png")
par(mfrow = c(2,2))
with(data, {
    hist(global_active_power, col = "red", 
            main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)")
    plot(voltage~ymd_hms(date_time), type = "l",
         xlab = "datetime", ylab = "Voltage")
    plot(sub_metering_1~ymd_hms(date_time), type = "l", col = "black",
         main = NULL, xlab = "", ylab = "Energy sub metering")
    lines(sub_metering_2~ymd_hms(date_time), col = "red")
    lines(sub_metering_3~ymd_hms(date_time), col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"),
           legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
           bty = "n", cex = 0.5)
    plot(global_reactive_power~ymd_hms(date_time), type = "l",
         xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()

