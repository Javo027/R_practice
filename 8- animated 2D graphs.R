install.packages("gganimate")
library(gganimate)
library(ggplot2)
install.packages("gifski")
install.packages("av")
install.packages("gapminder")
library(gifski)
library(av)

data()

library(gapminder)
head(gapminder)
nrow(gapminder)
ggplot(gapminder, aes(gdpPercap, gapminder$lifeExp))+ geom_point() # simple graph

ggplot(gapminder, aes(gdpPercap, gapminder$lifeExp, size= pop))+ geom_point()

ggplot(gapminder, aes(gdpPercap, gapminder$lifeExp, size= pop, col= country))+ geom_point(show.legend = FALSE)

ggplot(gapminder, aes(gdpPercap, gapminder$lifeExp, size= pop, col= country))+ 
  geom_point(show.legend = FALSE, alpha= 0.8)

# change the color
library(viridis)
install.packages("viridisLite")
library(viridisLite)
ggplot(gapminder, aes(gdpPercap, lifeExp, size= pop, col= country))+ 
  geom_point(show.legend = FALSE, alpha= 0.8)+
  scale_colour_viridis_d()+
  scale_size(c(1,10))+
  scale_x_log10() # to clear the gap in the data

# now change the labels and name the plot
An1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size= pop, col= country))+ 
  geom_point(show.legend = FALSE, alpha= 0.8)+
  scale_colour_viridis_d()+
  scale_size(c(1,10))+
  scale_x_log10()+ facet_wrap(~continent, nrow = 1)+
  labs(x= "GDP per capita", y= "life expentancy")
  

An1
An1+ transition_time(year)

An2 <- An1+ transition_time(year)
animate(An2, duration = 10, fps = 20, width= 300, height= 300, renderer = gifski_renderer())
anim_save("output.gif", An2)+
  labs(title = "year:(frame_time)")+
  ease_aes("linear")

