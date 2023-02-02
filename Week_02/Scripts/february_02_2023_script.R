### This is my first script. I am learning how to import data #####
### Created by: Cindy Fajardo
### Created on: 2023-02-02
#############################################################
### Load libraries ####################
library(here)
library(tidyverse)
### Read in data####
Weightdata <- read_csv(here("Week_02", "Data", "weightdata.csv"))
Weightdata ### shows all data
head(Weightdata) ## Looks at the top 6 lines of data frame
head(Weightdata, 4) ## Looks at the top 4 lines of data frame, integer used will proves x amount of lines, i.e 4
tail(Weightdata) ## Looks at bottom 6 lines
tail(Weightdata, 9) ## Looks at however many bottom lines you designate, like 9
View(Weightdata) ## View data in separate window
glimpse(Weightdata) ## Will show you the type of data you have
