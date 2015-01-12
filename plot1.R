a <- read.table(File, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE) ## Reading data into R
# head(a)
a$Date <- strptime(a$Date, '%d/%m/%Y') ## Converting date to date format
## b <- a[a$Date >= "2007-02-01" & a$Date <= "2007-02-02",] ## TEsting different options
c <- subset(a,a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
hist(c$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="./ExData_Plotting1/plot1.png", width = 400, height = 400)
dev.off()