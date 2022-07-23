library(ggplot2)

#violen plots
data()
data("CO2")
x <- CO2
nrow(x)
ncol(x)
names(x)

head(x)
str(x)

sample_x <- x[seq(from= 1, to= 84, by= 2),]
nrow(sample_x)
p1 <- ggplot(sample_x,  mapping= aes(x= uptake, y= conc, fill= Type))+ 
  geom_violin()+ geom_jitter(size= 0.5)+
  geom_boxplot(zixe= 0.1)
p1+ ggsave("violin.png")


