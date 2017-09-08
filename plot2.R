data <- read.table("data_cleaned.csv", sep = ",", header = TRUE)

# Plot 2 (line plot of Global Active Power use over time)
names(data)
png(file = "plot2.png")
plot(data$global_active_power~ymd_hms(data$date_time), type = "l",
     main = NULL, xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
