data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

datetime <- as.POSIXct(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

with(data,{
        ##1
        plot(x=datetime, y=data$Global_active_power, type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
        ##2
        plot(x=datetime, y=data$Voltage, type="l",ylab = "Voltage (volt)", xlab = "")
        ##3
        plot(x=datetime, y=Sub_metering_1, type="l",ylab="Global Active Power (kilowatts)", xlab="")
        lines(x=datetime, y=Sub_metering_2, col='Red')
        lines(x=datetime, y=Sub_metering_3, col='Blue')
        legend("topright", col=c("black","red","blue"), lty=1, bty="n",cex=.5, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        ##4
        plot(x=datetime, y=data$Global_reactive_power, type="l",ylab = "Global Reactive Power (kilowatts)", xlab = "")
        
})

dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()

