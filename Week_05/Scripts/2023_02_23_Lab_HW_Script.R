#########
# Lab Homework Script
# Created by: Cindy Fajardo
# Created on: 2023_02_23

#########
# Load Libraries
library(tidyverse)
library(here)
library(lubridate)
library(devtools)
library(hrbrthemes)
library(beyonce)

########
# Data Wrangling
CondData <- read_csv(here("Week_05","Data","CondData.csv")) %>% #read in data and then,
  mutate(date = mdy_hms(date), #mutate so time is in year, month, date, hours, minutes, seconds
         date = round_date(date,"10 seconds")) #round to the nearest 10 seconds
View(CondData)

DepthData <- read_csv(here("Week_05","Data","DepthData.csv")) #read in depth data
View(DepthData)

full_data <- inner_join(CondData,DepthData) %>% #do a complete join without na's
  mutate(date = round_date(date, "minute")) %>% #round time to minutes
  group_by(date) %>% #group time by date
  summarise(avg_temp = mean(Temperature), #summarize function used to get mean of all variables
            avg_salinity = mean(Salinity),
            avg_depth = mean(Depth))
View(full_data)

#This didn't work
full_data_long <- full_data %>% #calling full data
  pivot_longer(cols = avg_temp:avg_depth, #Pivots data
               names_to = "Variables",
               values_to = "Values")
View(full_data_long) 

###THIS DID NOT WORK
#ggplot(full_data_long,
       #aes(x = Variables,
           #y = Values))+
  #geom_point()+
  #facet_grid(~date)

#This almost worked the way I wanted
ggplot(full_data,
       aes(x = date))+
  geom_line(aes(y = avg_temp,
                color = "Teperature"))+
  geom_line(aes(y = avg_salinity,
                color= "Salinity"))+
  labs(x = "Date",
       y = "",
       title = "Average Temperature and Salinity Over Time",
       color = "Variables")+
  scale_color_manual(values = c("blue", "orange"))+
  theme_light()
#I was attempting to add depth on the line graph as well but couldn't.
#I got error "Error: Continuous value supplied to discrete scale" 
#Tried to make mean depth as a factor in code but rendered a weird graph. 