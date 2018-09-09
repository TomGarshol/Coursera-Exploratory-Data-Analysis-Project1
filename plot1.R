## Download and unzip the zip file data from the website ##
getwd()
if(!file.exists("./plotdata"))
        dir.create("./plotdata")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "~/Documents/Coursera/Exploratory Data Analysis/project 1/plotdata/household_power_consumption.zip", method = "curl")
listzip <- unzip("~/Documents/Coursera/Exploratory Data Analysis/project 1/plotdata/household_power_consumption.zip", exdir = "~/Documents/Coursera/Exploratory Data Analysis/project 1/plotdata")

## Read the data and subset it for 2007-02-01 and 2007-02-02 only into R ##
powerConsumption <- read.table("~/Documents/Coursera/Exploratory Data Analysis/project 1/plotdata/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
head(powerConsumption)
data <- powerConsumption[as.character(powerConsumption$Date) %in% c("1/2/2007", "2/2/2007"), ]
head(data)

## Convert the Date and Time variables to Date/Time classes 
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
head(data)

## Plot1 ##
with(data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red"))
dev.copy(png, file = "plot1.png",width = 480, height = 480, units='px')
dev.off()