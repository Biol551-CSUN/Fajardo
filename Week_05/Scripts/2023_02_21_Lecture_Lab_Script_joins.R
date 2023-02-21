## Today we are going to practice joins with data from Becker and Silbiger
## Created by: Cindy Fajardo
## Created on 2023_02_21

## Libraries
library(tidyverse)
library(here)
library("cowsay")

## Load data
#Environmental data from each site
EnviroData <- read_csv(here("Week_05","Data","site.characteristics.data.csv"))
TPCData<-read_csv(here("Week_05","Data","Topt_data.csv"))
glimpse(EnviroData)
glimpse(TPCData)

EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values)%>%
  arrange(site.letter) # arrange the dataframe by site
View(EnviroData_wide)

FullData_left<- left_join(TPCData, EnviroData_wide)
head(FullData_left)

FullData_left<- left_join(TPCData, EnviroData_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data

head(FullData_left)
View(FullData_left)

FullData_left_long <- FullData_left %>% #naming new dataframe
  pivot_longer(cols = E:substrate.cover, #pivot long from for all numerical values
               names_to = "Variables", #name of new column
               values_to = "Values") %>% #where to put all numerical values
  group_by(site.letter,Variables) %>% #group by site letter and variables
  summarise(mean_vals= mean(Values, na.rm=TRUE), #mean values
            var_vals= var(Values, na.rm=TRUE)) #variance values
View(FullData_left_long)

#Making a tibble
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2

left_join(T1,T2) #T2joins T1, E is deleted
right_join(T1,T2) #T1 joins T2, C is deleted
inner_join(T1,T2) #missing values are deleted
full_join(T1,T2) #everything shows ups, NA's too
semi_join(T1, T2) #will only show you complete rows
anti_join(T1, T2) #shows you what you are missing

say("hello", by = "shark")
say("I want pets", by = "cat")

T1 <- tibble(Site.ID = c("Upper_Mid", "Mid_Low", "Low"), 
             Density = c("36, 20, 7"))
T2 <- tibble(Site.ID = c("Upper_Mid","Mid_Low","Low_Low"),
             Temperature = c("25, 17, 9"))
left_join(T1,T2)
right_join(T1,T2)
inner_join(T1,T2)
full_join(T1,T2)
semi_join(T1, T2)
anti_join(T1, T2)
