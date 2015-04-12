## read data
power.df <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=c(rep('character', 2), rep('numeric', 7)))

## convert dates and times
power.df$Date <- dmy(power.df$Date)
power.df$Time <- hms(power.df$Time)

## subset data to data required for the assignment
power.df <- subset(power.df, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

# put date and time ine one variable
power.df$date.time <- power.df$Date + power.df$Time

## plot 3
png("plot3.png")
plot(power.df$date.time, power.df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(power.df$date.time, power.df$Sub_metering_2, col='red')
lines(power.df$date.time, power.df$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid')
dev.off()