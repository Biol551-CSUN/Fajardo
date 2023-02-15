###Today we are going to plot penguin data###
###Created by: Cindy Fajardo
###Created on: 2023_02_14

###Load Libraries###
library(palmerpenguins)
library(tidyverse)
library(here)

###Load data###
glimpse(penguins)

head(penguins)

###Filtering###
filter(.data = penguins, sex == "female")

filter(.data = penguins,
       year == "2008" | year == "2009") #Penguins that were collected in either 2008 or 2009

filter(.data = penguins,
       island != "Dream") #Penguins that are not from the island Dream

filter(.data = penguins, species %in% c("Adelie","Gentoo")) #Penguins in the species Adelie and Gentoo

###Mutating###
data2 <- mutate(.data = penguins,
                body_mass_kg = body_mass_g/1000)
View(data2)       

data2 <- mutate(.data = penguins,
                body_mass_kg = body_mass_g/1000,
                bill_length_depth = bill_length_mm/bill_depth_mm)
View(data2)

data2 <- mutate(.data = penguins,
                after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))

data3 <- mutate(.data = penguins,
                as_big = ifelse(body_mass_g>4000, "as big", "small")) #Use mutate and ifelse to create a new column where body mass greater than 4000 is labeled as big and everything else is small
data3
View(data3)

data4 <- mutate(.data = penguins,
                flipper_and_body_mass = body_mass_g + flipper_length_mm) #Use mutate to create a new column to add flipper length and body mass together
View(data4)

#####The Pipe and Select
penguins %>% #and then filet (next line of code)
  filter(sex == "female") %>% #and then mutate (next line of code)
  mutate(log_mass = log(body_mass_g)) %>% #and then select (next line of code)
  select(Species = species, island, sex, log_mass) #select species and change name of original title, island, sex, log_mass

#####Summarize
penguins %>%
  summarise(mean_flipper = mean(flipper_length_mm, na.rm = TRUE))

penguins %>% # 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE),
            min_flipper = min(flipper_length_mm, na.rm=TRUE)) #Calculate mean and min flipper length

#group_by
penguins %>%
  group_by(island) %>% #group ny island
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))

penguins %>%
  group_by(island, sex) %>% #Group by both island and sex
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))

#NA's
penguins %>%
  drop_na(sex) %>%
  group_by(island, sex) %>%
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) ## summarise()has grouped output by 'island'. You can override using the groups argument.

#pipping into ggplot
penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()

library(devtools)
devtools::install_github("jhollist/dadjokeapi")
groan()
