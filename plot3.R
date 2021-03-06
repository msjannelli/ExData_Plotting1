plot3 <- function() {
  setwd("C:/Users/Maria Jannelli/Desktop/RProgramming/exdata-data-household_power_consumption/")
  w1=read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
  DateTimeFunction=function(x,y) {paste(x,y,sep=" ")}
  w1$Date_Time1=mapply(DateTimeFunction,w1$Date,w1$Time)
  w1$Date_Time=strptime(w1$Date_Time1,format="%d/%m/%Y %H:%M:%S")
  w1$Date=strptime(w1$Date, format="%d/%m/%Y")
  #w1$Global_active_power=as.numeric(w1$Global_active_power)
  #w1$Global_intensity=as.numeric(w1$Global_intensity)
  #w1$Global_reactive_power=as.numeric(w1$Global_reactive_power)
  w1$Sub_metering_1=as.numeric(w1$Sub_metering_1)
  w1$Sub_metering_2=as.numeric(w1$Sub_metering_2)
  w1$Sub_metering_3=as.numeric(w1$Sub_metering_3)
  w1$Voltage=as.numeric(w1$Voltage)
  w1=subset(w1,w1$Date>=as.POSIXlt("2007-02-01") & w1$Date<=as.POSIXlt("2007-02-02"))
  png(file="plot3.png",width=480,height=480)
  plot(w1$Date_Time,w1$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
  lines(w1$Date_Time,w1$Sub_metering_2,col="red")
  lines(w1$Date_Time,w1$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}
