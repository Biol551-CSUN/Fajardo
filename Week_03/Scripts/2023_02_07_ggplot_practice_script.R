### GGplot Script
### Created by: _Cindy Fajardo_
### Created on 2023-02-07
#################################
library(tidyverse) #always do this
library(here) #did not need to do this but did it anyways
library(palmerpenguins) #calling palmer penguins
glimpse(penguins) #a quick view of palmer penguins

ggplot(data=penguins, #start with dataframe
       mapping = aes(x = bill_depth_mm, #map bill depth to X AXIS
                     y = bill_length_mm, #add bill lenght to Y AXIS
                     color = species)) + #add map species to the color of each point
       geom_point() + #Represent each observation with a point.
        labs(title = "Bill depth and lenght", #Add title to plot 
        subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins", #Add subtitle 
        x = "Bill depth (mm)", y = "Bill length (mm)", #Add labels to x and y axis  
        color = "Species", #label legend "Species"
        caption = "Palmer Station LTER / palmerpenguins") + #add caption
  scale_color_viridis_d() #add discrete color scale

#####
##Shape##
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     shape = island #mapped to a different variable than color
       )) +
  geom_point()+
  labs(title = "Bill depth and length",
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species") +
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species, 
                     size = body_mass_g #size of dots are corresponding to values of body mass, chonky ones are big circles
       )) +
  geom_point()+
  scale_color_viridis_d()

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     size = body_mass_g,
                     alpha = flipper_length_mm #transparency
       )) +
  geom_point()+
  scale_color_viridis_d()


#####
#Setting

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point(size = 2, alpha = 0.5) 

#######
#Facets

ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(species~sex) #facet_grid(rows,columns) will always give you a square

ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species) #can change rows and colums

ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() +
  facet_wrap(~ species) #~ species because we want only species as columns

ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm)) + 
  geom_point() +
  facet_wrap(~ species, ncol=2) # make it two columns

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species, #adds color to facet grid
       )) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(species~sex) 

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
       )) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(species~sex)+
  guides(color = FALSE) #deletes the legends
