library(ggplot2)
library(readxl)
x <- read_excel("x.xlsx", sheet = "Sheet1", 
                range = "A1:D10", col_types = c("text", 
                                                "numeric", "numeric", "numeric"))
View(x)
ggplot(data = x, mapping = aes(x= sample, y= height))+ geom_point()

ggplot(data = x, mapping = aes(x= sample, y= height), col= "blue")+ geom_point()
ggplot(x, aes(sample, height))+ geom_point(size= 2)+ geom_line()

ggplot(x, aes(sample, height))+ geom_boxplot()+ 
  geom_point(colour= "green", alpha= 0.8)

ggplot(x, aes(sample, height, fill= mass)) +
  geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x= "sample type", y= "height (cm)", 
       title = "sample growth")+
  theme_bw()+
  coord_flip()+
  ggsave("ggplot1.tiff", units = "in", width = 8, height = 6, dpi = 300, 
         compression= 'lzw')
  
