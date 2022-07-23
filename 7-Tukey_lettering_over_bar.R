data("chickwts")
anova <- aov(weight ~ feed, data = chickwts)
summary(anova)

# tukey test
tukey <- TukeyHSD(anova)
tukey

#compact letter display cld
install.packages("multcomp")
install.packages("multcompView")
install.packages("ggthemes")
library(ggthemes)
library(dplyr) #for data handling/amendment
library(multcompView) #for comparison
library(multcomp)
cld <- multcompLetters4(anova, tukey)
cld

# table with factors and 3rd quantile
dt <- group_by(chickwts, feed) %>%
  summarise(w= mean(weight), sd= sd(weight)) %>%
  arrange(desc(w))

# extracting the compact letters to the display and add the in Tk table
cld <- as.data.frame.list(cld$feed)
dt$cld <- cld$Letters
print(dt)
# it will add cld as column

ggplot(dt, aes(feed, w))+
  geom_bar(stat= "identity", aes(fill= w), show.legend= FALSE)+
  geom_errorbar(aes(ymin= w-sd, ymax= w+sd), width= 0.2)+
  labs(x= "feed type", y= "average weight gain(g)")+
  theme_few()

# add the lettering and add verticle/ horizontal adjustments
ggplot(dt, aes(feed, w))+
  geom_bar(stat= "identity", aes(fill= w), show.legend= FALSE)+
  geom_errorbar(aes(ymin= w-sd, ymax= w+sd), width= 0.2)+
  labs(x= "feed type", y= "average weight gain(g)")+
  geom_text(aes(label= cld), vjust= -0.5, hjust= -0.5)+
  theme_few()

# adjust the lettering and add y limit
ggplot(dt, aes(feed, w))+
  geom_bar(stat= "identity", aes(fill= w), show.legend= FALSE)+
  geom_errorbar(aes(ymin= w-sd, ymax= w+sd), width= 0.2)+
  labs(x= "feed type", y= "average weight gain(g)")+
  geom_text(aes(label= cld, y= w+sd), vjust= -0.5)+ ylim(0,400)
  theme_few()
