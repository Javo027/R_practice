# heat maps
library(ggplot2)
data("iris")
x= iris
install.packages("reshape")
library(reshape)

x1 <- melt(x)
View(x)
View(x1)
# to make a heatmap, you have to combine numeric variables in one column and cetagoric in other, like in x1
ggplot(data= x1, mapping = aes(x= Species, y= variable, fill= value))+
  geom_tile()+ scale_fill_gradient(low= "green", high = "red")
