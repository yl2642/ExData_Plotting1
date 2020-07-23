data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

datetime <- as.POSIXct(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

plot(x=datetime, y=data$Global_active_power, type="l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()

