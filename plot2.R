# ===================================================================
#                      Exploratory Data Analysis
#                            Assignment #1
# ===================================================================

Sys.setlocale("LC_TIME", "English")

setwd("C:/Courses/ExData/Assignment 1/ExData_Plotting1")

# Read in the data, and mark ?-symbols as NA
df <- read.csv("../household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE)

# print table to show NA's - and keep only complete cases (no na's) 
print(as.data.frame(sapply(df, function(y) sum(length(which(is.na(y)))))))
df <- df[complete.cases(df),]

# Convert date and time into one object, named timestamp
str(df)
df$Timestamp <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Add the weekdays
df$Day <- weekdays(as.Date(df$Timestamp), abbreviate = TRUE)

# Subset the ata.frame
df <- df[df$Timestamp >= "2007-02-01" & df$Timestamp < "2007-02-03" & 
         df$Day %in% c("Thu", "Fri", "Sat"), ]

# Make the historgram plot
png(filename = "plot2.png",width = 480, height = 480)
plot(df$Timestamp, df$Global_active_power, 
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
     )
dev.off()

