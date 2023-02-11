#########################
#Best Penguin Plot#
#created by: Cindy Fajardo
#Created on 2023-02-09


###Load libraries#####
library(palmerpenguins)
library(tidyverse)
library(here)
library(devtools)
library(beyonce)
library(ggthemes)

View(penguins)
#will work on sex and body mass per species

penguins %>% 
  na.omit() %>% ##omits na's in data
ggplot(penguins %>% na.omit,
      mapping = aes(x = sex,
                    y = body_mass_g,
                    group = species,
                    color = species))

penguins_summary <- penguins%>% ##summarizes data by sex and species
  group_by(sex, species) %>% 
  summarize(mean=mean(body_mass_g),
            sum=sum(body_mass_g))

penguins_summary

ggplot(penguins_summary %>% na.omit,
       mapping = aes(x = sex,
                     y = mean,
                     group = species,
                     color = species,
                     fill = species)) +
  geom_col(position = "dodge2") +
  labs(x = "Sex of Penguins", 
       y = "Body Mass of Penguins (g)",
       title="Body Mass of Penguins by Sex of Three Different Species") +
    scale_fill_manual(values = beyonce_palette(18)) +
  scale_color_manual(values = beyonce_palette(18))
