###Tidyr Homework Script###
### Created by: Cindy Fajardo###
### Created on: 2023_02_16###

###Load Libraries###
library(tidyverse)
library(here)
library(ggbernie)
library(ggplot2)
library(hrbrthemes)
library(readr)

###Load Data###
ChemData <- read_csv(here("Week_04","Data","chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

#Data Wrangling
ChemData_clean<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time column
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_", # separate by _
           remove = FALSE) %>% 
  filter(Tide=="Low", Time=="Day") %>% 
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") %>% 
  group_by(Variables, Season, Tide) %>% 
  summarise(chem_means = mean(Values, na.rm = TRUE),
            chem_vars = var(Values, na.rm = TRUE),
            chem_min = min(Values, na.rm = TRUE),
            chem_max = max(Values, na.rm = TRUE),
            chem_sd = sd(Values, na.rm = TRUE)) %>% 
  write_csv(here("Week_04","Output","2023_02_16_homework.csv"))# export as a csv to the right folder


#plot
ChemData_plot<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time column
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_", # separate by _
           remove = FALSE)
View(ChemData_plot)
homework_plot_2023_02_16 <- ggplot(ChemData_plot,
                                   aes(x=Temp_in,
                                       fill =Season))+
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +
  scale_fill_manual(values=c("#69b3a2", "#404080")) +
  theme_ipsum() +
  labs(title="Temperature Recorded over Two Seasons",
       fill="Season",
       x="Temperature (C)")

homework_plot_2023_02_16

