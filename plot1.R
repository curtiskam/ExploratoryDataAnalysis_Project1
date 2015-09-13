##Assign FileName to Data File
FileName <- "household_power_consumption.txt"

##Read Data File
Data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Get the 2 days we want - Days and Months reversed
SubSet <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

##Get Globa Active Power
GlobalActivePower <- as.numeric(SubSet$Global_active_power)

##Assign Filename for output
png("plot1.png", width=800, height=800)

##Draw Histogram of Data
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##close device
dev.off()