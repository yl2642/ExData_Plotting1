data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

datetime <- as.POSIXct(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

with(data,{
        plot(x=datetime, y=Sub_metering_1, type="l",ylab="Global Active Power (kilowatts)", xlab="")
        lines(x=datetime, y=Sub_metering_2, col='Red')
        lines(x=datetime, y=Sub_metering_3, col='Blue')
        
})
legend("topright", col=c("black","red","blue"), lwd=c(1,1,1), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()

