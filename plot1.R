#Read data from the file
my_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Subset to extract required data
Power <- subset(my_data, my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007" )

#Set PNG file as plot device
png("plot1.png", height = 480, width = 480)

#Plot the graph
hist(as.numeric(Power$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

#Close the plotting device
dev.off()




