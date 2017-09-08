setwd("../Documents/Coursera/Assignments/Course 4, Week 1")

data <- read.table("household_power_consumption.txt", sep = ";", na = "?", header = TRUE)

# Change column names to lower case
colnames(data) <- tolower(names(data))

# Check date format and set to date class
head(data$date)
library(lubridate)
data$date <- dmy(data$date)
class(data$date)

# Keep dates in range 2007-02-01 to 2007-02-02
library(dplyr)
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
data <- filter(data, date>=date1 & date<=date2)

# add date and time variable
data <- mutate(data, date_time = paste(date, time))

# Save dataframe to open in other files
write.csv(data, "data_cleaned.csv")

# Plot 1 (histogram of Global Active Power)
names(data)
png(file = "plot1.png")
with(data, hist(global_active_power, col = "red", 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)"))
dev.off()


