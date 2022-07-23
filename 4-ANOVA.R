library(readxl)
x <- read_excel("x.xlsx", sheet = "Sheet1", 
                range = "A1:D10", col_types = c("text", 
                                                "numeric", "numeric", "numeric"))

View(x)

mean(x$height)
mean(x$weight)
median(x$height)

mode(x$weight)

min(x$mass)
max(x$mass)

range(x$mass)

quantile(x$height, .25)
quantile(x$height, .75)

sd(x$weight)
sd(x$height)

var(x$height)

lapply(x[, 2:3], mean) #before , we wrote nothing because we only want mean ofcolumns not rows
# (row, column)
lapply(x[, 2:3], sd)
summary(x)

lapply(x[, 3:4], mean)

#ANOVA
a1 <- aov(x$height ~ x$sample)
summary(a1)

TukeyHSD(a1)

#group, anova
a2 <- aov(x$height ~ x$ sample * x$weight)
summary(a2)
library(agricolae)
