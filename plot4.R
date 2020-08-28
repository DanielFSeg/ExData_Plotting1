############################################################
#       4th plot of Exploratory Data Analysis Course       #
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


##### Multiple plots (Plot 4)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))


# 1st


with(db, plot(Date, Global_active_power, 
              type = "l",
              xlab = "",
              ylab = "Global Active Power"))

# 2nd

with(db, plot(Date, Voltage, 
              type = "l",
              xlab = "",
              ylab = "Voltage"))


# 3rd

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


# 4th

with(db, plot(Date, Global_reactive_power, 
              type = "l",
              xlab = "",
              ylab = "Global Reactive Power"))


par(mfrow = c(1,1))

dev.off()





