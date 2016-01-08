# ===================================================================
#                      Exploratory Data Analysis
#                            Assignment #1
# ===================================================================

# Set the working directory
setwd("C:/Courses/ExData/Assignment 1/ExData_Plotting1")

# Read in the data, and mark ?-symbols as NA
df <- read.csv("../household_power_consumption.txt", sep=";", na.strings = c("?"), stringsAsFactors = FALSE)

# print table to show NA's - and keep only complete cases (no na's) 
print(as.data.frame(sapply(df, function(y) sum(length(which(is.na(y)))))))
df <- df[complete.cases(df),]

# Convert date and time into one object, named timestamp
str(df)
df$Timestamp <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

# Subset the 
df <- df[df$Timestamp >= "2007-02-01" & df$Timestamp < "2007-02-03", ]

# Make the historgram plot
png(filename = "plot1.png",width = 480, height = 480)
with(df, hist(Global_active_power,
              col = "red",
              main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)",
              ylab = "Frequency"
             ))
dev.off()

