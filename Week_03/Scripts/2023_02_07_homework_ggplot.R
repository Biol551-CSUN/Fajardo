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
library(magrittr)

View(penguins)
#will work on sex and body mass per species


penguins_summary <- penguins %>%
  group_by(sex, species) %>% 
  summarize(mean=mean(body_mass_g),
            sum=sum(body_mass_g))

penguins_summary

ggplot(penguins_summary %>% na.omit,
       mapping = aes(x = sex,
                     y = mean,
                     group = species,
                     fill = species)) +
  geom_col(position = "dodge2") +
  labs(x = "Sex of Penguins", 
       y = "Body Mass of Penguins (g)",
       title="Body Mass of Penguins by Sex of Three Different Species",
       color = "Species") +
    scale_fill_manual(values = beyonce_palette(18)) +
  scale_color_manual(values = beyonce_palette(18)) +
  theme_classic()+
  theme(plot.title = element_text(size = 15,
                                  color = "purple"))
ggsave(here("Week_03","Output","2023_02_14_Homework.png"))


#####
#Hanna's plot#
ggplot(penguins %>% na.omit(),
       mapping=aes(x=body_mass_g,
                   group=species,
                   fill=species)) +
  geom_density() +
  facet_grid(species~sex) +
  theme_classic() +
  labs(x="Body mass of Penguins (g)",
       y="Density") +
  scale_fill_manual(values= beyonce_palette(18)) + ##never using anything else (jk), Beyonce is a queen with these blues +
  theme(axis.text.x=element_text(size=13),
        axis.text.y=element_text(size=13))
