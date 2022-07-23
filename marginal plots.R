# marginal plots
library(ggplot2)
install.packages("ggExtra")
library(ggExtra)
data(mpg)
x <- mpg
p1 <- ggplot(x, aes(cty, hwy, fill= cty))+ geom_count()+
  geom_smooth(method = "lm")
p1
ggMarginal(p1, type="box plot", fill= "transparent")
ggMarginal(p1, type="histogram", fill= "transparent")
ggMarginal(p1, type="violin", fill= "transparent")
ggMarginal(p1, type="densigram", fill= "transparent", groupColour = TRUE)
help("ggMarginal")

p1 <- ggplot(x, aes(cty, hwy, fill= cty, col= x$manufacturer))+ geom_count()+
  geom_smooth(method = "lm")
p1+facet_wrap(~cty)+theme_dark()# facet will group
last_plot()# to return to previous plot
