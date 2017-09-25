## Benjamin Basow 
## Exploratory Data Analysis Assignment 1
## Plot 4


## Setting the working directory

setwd("C:/Users/user/Desktop/data_science/explore_data_assignment_1/")

## Loading the data set

table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
                    
                    colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formating the data to type data

table$Date <- as.Date(table$Date, "%d/%m/%Y")

## Create a data set with desired dates

table <- subset(table,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove all incomeplete data values

table <- table[complete.cases(table),]

## Combine Dates and Times into one object

dateTime <- paste(table$Date, table$Time)

## Naming the object

dateTime <- setNames(dateTime, "DateTime")

## Removing the original Date and Time column

table <- table[ ,!(names(table) %in% c("Date","Time"))]

## Add the newly created DateTime column

table <- cbind(dateTime, table)

## Format dateTime Column

table$dateTime <- as.POSIXct(dateTime)



## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(table, {
  
  plot(Global_active_power~dateTime, type="l", 
       
       ylab="Global Active Power", xlab="")
  
  plot(Voltage~dateTime, type="l", 
       
       ylab="Voltage", xlab="datetime")
  
  plot(Sub_metering_1~dateTime, type="l", 
       
       ylab="Global Active Power", xlab="")
  
  lines(Sub_metering_2~dateTime,col='Red')
  
  lines(Sub_metering_3~dateTime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), 
         
         lty=1, lwd=2, bty="n",
         
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~dateTime, type="l", 
       
       ylab="Global_rective_power",xlab="datetime")
})

## Create png file

dev.copy(png, file="plot4.png", height=480, width=480)

## Delete plot from enviornment

dev.off()



