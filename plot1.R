if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}#unzipping

hpc <- read.table("household_power_consumption.txt", header=T, sep=";")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
df <- hpc[(hpc$Date=="2007-02-01") | (hpc$Date=="2007-02-02"),]
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)#converting dates

plot1 <- function() {
        hist(df$Global_active_power, main = paste("Global Active Power"), col="orange", xlab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
        cat("Plot1.png has been saved in", getwd())
}
plot1()

