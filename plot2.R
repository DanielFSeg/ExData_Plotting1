############################################################
#       2nd plot of Exploratory Data Analysis Course       #
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

##### Plotting the line (Plot 2)

png(filename = "plot2.png", width = 480, height = 480)

with(db, plot(Date, Global_active_power, 
              type = "l",
              xlab = "",
              ylab = "Global Active Power (kilowatts)"))

dev.off()
