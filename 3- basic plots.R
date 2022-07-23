library(readxl)
x_r <- read_excel("x_r.xlsx", sheet = "Sheet1", 
                  range = "A1:D10", col_types = c("text", 
                                                  "numeric", "numeric", "numeric"), 
                  na = "0")
View(x_r)

#plotting
#script chart
stripchart(x_r$DPPH)
stripchart(x_r$polyphenols ~ x_r$flavonoids)

#histogram
hist(x_r$DPPH)
hist(x_r$polyphenols)
#frequency shows no. of observations

#scatterplot
plot(x_r$polyphenols ~ x_r$flavonoids)

#qqnorm plot
qqnorm(x_r$DPPH)

#barplot
barplot(x_r$polyphenols)

#mosaic plot
mosaicplot(~ x_r$polyphenols + x_r$flavonoids)

#box plot
boxplot(x_r$polyphenols ~ x_r$sample)
