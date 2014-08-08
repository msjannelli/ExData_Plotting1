plot1 <- function() {
  setwd("C:/Users/Maria Jannelli/Desktop/RProgramming/exdata-data-household_power_consumption/")
  w1 <- read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
  dataset1 <- data.frame(w1)
  dataset1$Date <- as.Date(dataset1$Date, "%d/%m/%Y")
  newdata <- dataset1[dataset1$Date >= as.Date('1/2/2007', '%d/%m/%Y') & dataset1$Date <= as.Date('2/2/2007', '%d/%m/%Y'),]
  newdata <- newdata[complete.cases(newdata),]
  png(file="plot1.png",width=480,height=480)
  hist(as.numeric(as.character(newdata$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
  
}