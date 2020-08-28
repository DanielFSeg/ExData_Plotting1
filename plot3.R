############################################################
#       3rd plot of Exploratory Data Analysis Course       #
#                                                          #
#             Coursera - 2020 by Daniel F S                #
############################################################

##### Libraries 

library(tidyverse)

##### Loading and cleaning the data set

db <- read.table("data\\household_power_consumption.txt", 
                 header = TRUE,
                 na.strings = "?",
                 sep = ";") %>%
    
    filter(.[,1] == "1/2/2007" | .[,1] == "2/2/2007") %>%
    
    mutate(Date = as.Date(Date, format = "%e/%m/%Y"), 
           new_date = paste(Date, Time)) %>%
    
    mutate(Date = as.POSIXct(new_date)) %>%
    
    select(- Time, - new_date)

##### Plotting multiple lines (Plot 3)

png(filename = "plot3.png", width = 480, height = 480)

with(db, 
     plot(db[, "Sub_metering_1"] ~ Date, 
              type = "l",
              xlab = "",
              ylab = "Energy sub metering"))

lines(db[, "Sub_metering_2"] ~ db$Date, 
      type = "l",
      xlab = "",
      ylab = "Energy sub metering",
      col = "red")

lines(db[, "Sub_metering_3"] ~ db$Date, 
      type = "l",
      xlab = "",
      ylab = "Energy sub metering",
      col = "blue")

legend(x = "topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

