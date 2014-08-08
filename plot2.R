plot2 <- function() {
  setwd("C:/Users/Maria Jannelli/Desktop/RProgramming/exdata-data-household_power_consumption/")
  w1=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  DateTimeFunction=function(x,y) {paste(x,y,sep=" ")}
  w1$Date_Time1=mapply(DateTimeFunction,w1$Date,w1$Time)
  w1$Date_Time=strptime(w1$Date_Time1,format="%d/%m/%Y %H:%M:%S")
  w1$Date=strptime(w1$Date, format="%d/%m/%Y")
  w1$Global_active_power=as.numeric(w1$Global_active_power)
  w1=subset(w1,w1$Date>as.POSIXlt("2007-01-31") & w1$Date<as.POSIXlt("2007-02-03"))
  png(file="plot2.png",width=480,height=480)
  plot(w1$Date_Time,w1$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}