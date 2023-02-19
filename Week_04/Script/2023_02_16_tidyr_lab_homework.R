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
  group_by(Variables, Time, Tide) %>% 
  summarise(chem_means = mean(Values, na.rm = TRUE),
            chem_vars = var(Values, na.rm = TRUE),
            chem_min = min(Values, na.rm = TRUE),
            chem_max = max(Values, na.rm = TRUE),
            chem_sd = sd(Values, na.rm = TRUE))
View(ChemData_clean)
write_csv(here("Week_04","Output","2023_02_16_homework.csv"))  # export as a csv to the right folder
write.csv(ChemData_clean, file.path("C:/Users/cindy/OneDrive/Desktop/repositories/Fajardo/Week_04/Output", "2023_02_16_hw.csv"))

#plot
p <- ggplot(ChemData_clean, aes(x=x) ) +
  geom_histogram( aes(x = chem_means, y = ..density..), fill="#69b3a2" ) +
  geom_label( aes(x=75, y=0.01, label="Means"), color="#69b3a2") +
  scale_x_continuous(limits = c(0,150))+
  scale_y_continuous(limits = c(-0.3,1000))+
  geom_histogram( aes(x = chem_vars, y = -..density..), fill= "#404080") +
  geom_label( aes(x=4.5, y=-0.25, label="Variance"), color="#404080") +
  theme_ipsum() +
  xlab("value of x")
  
p
