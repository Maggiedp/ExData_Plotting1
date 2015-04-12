## read data
power.df <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

## convert dates and times
power.df$Date <- dmy(power.df$Date)
power.df$Time <- hms(power.df$Time)

## subset data to data required for the assignment
power.df <- subset(power.df, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

# put date and time ine one variable
power.df$date.time <- power.df$Date + power.df$Time

## plot 1
png("plot1.png")
hist(power.df$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.off()