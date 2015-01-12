a <- read.table(File, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) ## Reading data into R
# head(a)
a$Date <- strptime(a$Date, '%d/%m/%Y') ## Converting date to date format
## b <- a[a$Date >= "2007-02-01" & a$Date <= "2007-02-02",] ## TEsting different options
c <- subset(a,a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
c$DateTime <- paste(c$Date, c$Time)
c$DateTime <- strptime(c$DateTime, '%Y-%m-%d %H:%M:%S')  ## Converting time to time format
c$Day <- weekdays(as.Date(c$DateTime))
with (c, plot(DateTime,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file="./ExData_Plotting1/plot2.png", width = 400, height = 400)
dev.off()