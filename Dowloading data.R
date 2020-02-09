# downloding data 

url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

temp<- tempfile() # create temp file

download.file(url,temp) # dowload zip file to temp file

unzip<- unz(temp,"household_power_consumption.txt") # extract txt file  out of zip

data<- read.table(unzip,sep=";",header=TRUE) # load data 