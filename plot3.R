a <- read.table(File, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) ## Reading data into R
# head(a)
a$Date <- strptime(a$Date, '%d/%m/%Y') ## Converting date to date format
## b <- a[a$Date >= "2007-02-01" & a$Date <= "2007-02-02",] ## TEsting different options
c <- subset(a,a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
c$DateTime <- paste(c$Date, c$Time)
c$DateTime <- strptime(c$DateTime, '%Y-%m-%d %H:%M:%S')  ## Converting time to time format
c$Day <- weekdays(as.Date(c$DateTime))

png("./ExData_Plotting1/plot3.png", width=400,height=400)
  with (c, plot(DateTime,Sub_metering_1, type = "n", col="blue", ylab = "Energy sub metering") )
  with (c, points(DateTime,Sub_metering_1, type = "l", col="black") )
  with (c, points(DateTime,Sub_metering_2, type = "l", col="red") )
  with (c, points(DateTime,Sub_metering_3, type = "l", col="blue") )
  legend("topright", col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1)
dev.off()