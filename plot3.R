data <- read.table("data_cleaned.csv", sep = ",", header = TRUE)

# Plot 3 (line plot of sub-metering 1 to 3 over time)
names(data)
png(file = "plot3.png")
plot(data$sub_metering_1~ymd_hms(data$date_time), type = "l", col = "black",
     main = NULL, xlab = "", ylab = "Energy sub metering")
lines(data$sub_metering_2~ymd_hms(data$date_time), col = "red")
lines(data$sub_metering_3~ymd_hms(data$date_time), col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
dev.off()
