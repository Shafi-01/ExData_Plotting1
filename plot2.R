# plot2


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

globalActivePower<- sub_Data$Global_active_power

# str
png("plot2.png", width=480, height=480)



plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()



