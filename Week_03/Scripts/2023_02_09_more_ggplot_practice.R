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

###load data###
glimpse(penguins)

ggplot(data=penguins, 
      mapping = aes(x = bill_depth_mm,
                    y = bill_length_mm)) +
  geom_point()+
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  )
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point()+ 
  geom_smooth()+
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  )

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point()+ 
  geom_smooth(method = "lm")+
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) 

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species)) +
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) 


ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species)) +
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) 

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
  scale_color_viridis_d()

install.packages("praise")
library(praise)
praise()

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
  scale_y_continuous(limits = c(0,50))
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
  scale_x_continuous(breaks = c(14, 17, 21))

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
  scale_x_continuous(breaks = c(14, 17, 21), 
                     labels = c("low", "medium", "high"))

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
  #scale_color_viridis_d()
  scale_color_manual(values = c("orange", "purple", "green"))

###install color palette from github
library(devtools)

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
  scale_color_manual(values = beyonce_palette(20))

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
  geom_point()

ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  coord_trans(x = "log10", y = "log10")

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
  coord_polar("x") # make the polar

#####Themes
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
  theme_classic()

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
  theme_bw()

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
  theme(axis.title = element_text(size = 20))

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
                                  color = "red"))

plot_1<- ggplot(data=penguins, 
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
                                  color = "red"),
        panel.background = element_rect(fill = "linen"),
        panel.border = element_rect(color = "purple" ))
?theme

ggsave(here("Week_03","Output","cute_penguin.png"), 
       width = 7, height = 5)

plot_1
