# plot1


# downloding data 

url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp<- tempfile() # create temp file

download.file(url,temp) # dowload zip file to temp file

unzip<- unz(temp,"household_power_consumption.txt") # extract txt file  out of zip

data<- read.table(unzip,sep=";",header=TRUE) # load data 

# subseting  and transform data

sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sub_Data<- transform(sub_Data,Global_active_power = as.numeric(Global_active_power))

# str
png("plot1.png", width=480, height=480)

# ploting 

hist(sub_Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()






































