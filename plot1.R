############################################################
#       1st plot of Exploratory Data Analysis Course       #
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

##### Plotting the histogram (Plot 1)

png(filename = "plot1.png", width = 480, height = 480)

hist(db$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
