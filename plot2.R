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

## Open png device; create 'plot2.png' in current directory
png(filename="plot2.png",width=480,height=480,units="px")

## plot
with(subpwr, plot(subpwr$DateTime, subpwr$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

## Close the png file device
dev.off()
