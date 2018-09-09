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

## Plot3 ##
system("defaults write org.R-project.R force.LANG en_US.UTF-8") ## Change the console language to English ##
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = 'px')
dev.off()
