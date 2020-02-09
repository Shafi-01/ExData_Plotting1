# plot4


# downloding data 

url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp<- tempfile() # create temp file

download.file(url,temp) # dowload zip file to temp file

unzip<- unz(temp,"household_power_consumption.txt") # extract txt file  out of zip

data<- read.table(unzip,sep=";",header=TRUE) # load data 

# subseting  and transform data

sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sub_Data<- transform(sub_Data,Global_active_power = as.numeric(Global_active_power))

datetime <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

global_reactive_power<- sub_Data$Global_reactive_power

voltage_data<- as.numeric(sub_Data$Voltage)

subMetering_1 <- as.numeric(sub_Data$Sub_metering_1)

subMetering_2 <- as.numeric(sub_Data$Sub_metering_2)

subMetering_3 <- as.numeric(sub_Data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))


plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage_data, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()





