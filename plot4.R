##Assign Filename for Data
FileName <- "household_power_consumption.txt"

##Read File
Data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Get the 2 days we want - Month and Date reveresed
SubSet <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

##Get Time Data
Time <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Get Global Active Power Data
GobalActivePower <- as.numeric(subSet$Global_active_power)

##Get Submettering 1
SubMetering1 <- as.numeric(SubSet$Sub_metering_1)

##Get SubMetering 2
SubMetering2 <- as.numeric(SubSet$Sub_metering_2)

##Get SubMetering3
SubMetering3 <- as.numeric(SubSet$Sub_metering_3)

##Get Global Reative Power
GlobalReactivePower <- as.numeric(subSet$Global_reactive_power)

##Get Voltage
Voltage <- as.numeric(subSet$Voltage)

##Set Output File Name
png("plot4.png", width=800, height=800)

##Set graphs 2x2 by Rows
par(mfrow = c(2, 2)) 

#Graph Global Active Power
plot(Time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##Graph Voltage
plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage")

##Graph Energy Submetering1 in Black
plot(Time, SubMetering1, type="l", ylab="Energy Submetering", xlab="")

##Graph Energy Submetering 2 in Red
lines(Time, SubMetering2, type="l", col="red")

##Graph Energy Submetering 3 in Blue
lines(Time, SubMetering3, type="l", col="blue")

##Graph Global Reactive Power
plot(Time, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

##Add Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

##Close Device
dev.off()