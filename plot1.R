## Benjamin Basow 
## Exploratory Data Analysis Assignment 1
## Plot 1


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



## Plot 1

hist(table$Global_active_power, main="Global Active Power", 
     
     xlab = "Global Active Power (kilowatts)", col="red")

## Create png file

dev.copy(png,"plot1.png", width=480, height=480)

## Delete plot from enviornment

dev.off()