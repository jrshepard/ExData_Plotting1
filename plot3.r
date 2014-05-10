## Read Power Consumption Data into R
pwr <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",stringsAsFactors=FALSE)


## Convert date column to date
pwr$Date <- as.Date(pwr$Date,"%d/%m/%Y")

## Combine date and time
pwr$DateTime <- paste(pwr$Date,pwr$Time,sep=" ")

# Convert to POSIX
pwr$DateTime <- strptime(pwr$DateTime,"%Y-%m-%d %H:%M:%S")

## Subset February 1, 2007 to February 2, 2007
subpwr <- pwr[(pwr$Date == "2007-02-01" | pwr$Date == "2007-02-02"),]

## Open png device; create 'plot1.png' in current directory
png(filename="plot3.png",width=480,height=480,units="px")

## plot
with(subpwr, plot(subpwr$DateTime, subpwr$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n"))
with(subpwr,points(subpwr$DateTime,subpwr$Sub_metering_1,type="l"))
with(subpwr,points(subpwr$DateTime,subpwr$Sub_metering_2,type="l",col="red"))
with(subpwr,points(subpwr$DateTime,subpwr$Sub_metering_3,type="l",col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),pch="_")

## Close the png file device
dev.off()
