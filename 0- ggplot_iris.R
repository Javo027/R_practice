iris
x <- iris 
#y <- iris3
summary(x)
View(x)
plot(x)
library(ggplot2)
ggplot(data = x, aes(x= x$Species, y= x$Sepal.Length, fill= x$Species))+
  geom_boxplot()
  
ggplot(data = x, aes(x= Species, y= Sepal.Length, fill= x$Species))+
  geom_bar(position = "dodge", stat = "identity")+
  facet_wrap(~x$Species)+
  labs(title = "bar plot of iris")

ggplot(data = x, aes(x= Species, y= Sepal.Length, fill= x$Species))+
  geom_bar(position = "dodge", stat = "identity")+
  labs(title = "bar plot of iris", x= "Species", y= "Sepal length (cm)",
  fill= "Species")

ggplot(data = x, aes(x= Species, y= Sepal.Length, fill= x$Species))+
  geom_boxplot()+
  labs(title = "bar plot of iris", x= "Species", y= "Sepal length (cm)",
                      fill= "Species")
