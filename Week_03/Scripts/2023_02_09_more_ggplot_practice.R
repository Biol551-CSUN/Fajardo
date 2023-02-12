###Penguin Plots###
###Created by: Cindy Fajardo###
###Created on 2023-02-09###

###Load libraries#####
library(palmerpenguins)
library(tidyverse)
library(here)
library(devtools)
library(beyonce)
library(ggthemes)
library(praise)

###load data###
glimpse(penguins)

ggplot(data=penguins, #make a simple plot
      mapping = aes(x = bill_depth_mm,
                    y = bill_length_mm)) +
  geom_point()+
  geom_smooth()+ #add best fit line
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  )

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species, #group by species
                     color = species)) + #add some color by species
  geom_point()+ 
  geom_smooth(method = "lm")+ #make it a linear model
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_viridis_d() #color scale

library(praise)
praise()


###############################
#Scales#
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_viridis_d()+
  scale_x_continuous(limits = c(0,20)) # set x limits from 0 to 20

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_viridis_d()+
  scale_x_continuous(limits = c(0,20)) + # set x limits from 0 to 20 
  scale_y_continuous(limits = c(0,50)) #set y limits from 0 to 50
# Note anytime you make a vector you need to put "c" which means "concatenate

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_viridis_d()+
  scale_x_continuous(breaks = c(14, 17, 21), #change x breaks
                     labels = c("low", "medium", "high")) #change x break labels

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  #scale_color_viridis_d() change colors manualy
  scale_color_manual(values = c("orange", "purple", "green"))

###install color palette from github

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(20)) #use beyonce color palette

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  coord_flip() # flip x and y axes

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  coord_fixed() # fix axes

ggplot(diamonds, aes(carat, price)) +
  geom_point() #transform x axis

ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  coord_trans(x = "log10", y = "log10") #log10 x axis

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  coord_polar("x") # make them polar

#################
#Themes#
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_classic() #classic theme, only bottom and left border, no gridlines

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_bw() #make it theme bw, has grid lines and gives a border to graph

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20)) #change font size to axis label

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20,
                                  color = "red")) #change color to the axis labels

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(2)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20),
        panel.background = element_rect(fill = "linen")) #change background

?theme

ggsave(here("Week_03","Output","cute_penguin.png"), 
       width = 7, height = 5)

plot1<-ggplot(data=penguins,
              mapping = aes(x = bill_depth_mm,
                            y = bill_length_mm,
                            group = species,
                            color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(2)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20),
        panel.background = element_rect(fill = "linen"))
plot_1
