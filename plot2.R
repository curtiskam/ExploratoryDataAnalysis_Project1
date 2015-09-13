#assign FileName name of data file
FileName <- "household_power_consumption.txt"

# Read in Data File
Data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Get the 2 days we want - Month and Data revered
SubSet <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#get time data
Time <- strptime(paste(subSet$Date, SubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#get Global Active Power data
GlobalActivePower <- as.numeric(SubSet$Global_active_power)

#Assign Filename for Output
png("plot2.png", width=800, height=800)

# Plot Line for Global Acitive Power
plot(Time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Close Device
dev.off()

