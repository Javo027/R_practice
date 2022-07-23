library(readxl)
x1 <- read_excel("x.xlsx", sheet = "Sheet1", 
                range = "A1:D10", col_types = c("text", 
                                                "numeric", "numeric", "numeric"))

View(x1)
boxplot(x1$height ~ x1$sample)

#label the plot
boxplot(height ~ sample, data = x1)

boxplot(height ~ sample, data = x1, main= "boxplot of x1",
        xlab = "sample type", ylab = "plant height (cm)")

#coloring
boxplot(height ~ sample, data = x1, main= "boxplot of x1",
        xlab = "sample type", ylab = "plant height (cm)",
        col= "red", border= "orange")

#to add your choice of color, open color picker in google
# then copy the code written under HEX and paste in R code
boxplot(height ~ sample, data = x1, main= "boxplot of x1",
        xlab = "sample type", ylab = "plant height (cm)",
        col= "#ba77b7", border= "#a8170f")

#grouping of treatment
library(readxl)
x2 <- read_excel("x.xlsx", sheet = "Sheet2", 
                range = "A1:E10", col_types = c("text", 
                                                "numeric", "numeric", "numeric", 
                                                "text"))
View(x2)

#how to add another column
x2$sample <- factor(x2$sample, levels = c("aa", "bb", "cc"))
boxplot(height ~ sample * result, data = x2,
        main= "boxplot of x2", col= "yellow", border= "red")

# boxplot is also called as "whisker plot" due to the presence of error bars
# boxplot has Q1 (lower quartile) and Q3 (upper quartile) central is called median.
# whole box is interquartile range (IQR)
# whiskerbar along with Q1 is "min" and along with Q3 is mentioned as "max".
# quartile is denoted by q0(subscript)
# if central line (median line) is exactly at the middle, its "normal distribution".
# if central line is at the left side its reffered as "positive skew"
# if central line is at right side its called "negative skew".
# the discrition is called "dispersion of data.
# * is the outlier

#how to extract color from the picture

