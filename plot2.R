#Read data from the file
my_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Subset to extract required data
Power <- subset(my_data, my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007" )

#Correctly formatting date and time 
Power$Date <- as.Date(Power$Date, format = "%d/%m/%Y")
Power$Time <- strptime(Power$Time, format="%H:%M:%S")
Power[1:1440,"Time"] <- format(Power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Power[1441:2880,"Time"] <- format(Power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Set PNG file as plot device
png("plot2.png", height = 480, width = 480)

#Plot the graph
plot(Power$Time, as.numeric(Power$Global_active_power), type = "l", xlab = "" , ylab = "Global Active Power (kilowatts)")

#Close the plotting device
dev.off()
