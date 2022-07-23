library(readxl)
x <- read_excel("x.xlsx", sheet = "Sheet1", 
                range = "A1:D10", col_types = c("text", 
                                                "numeric", "numeric", "numeric"))
View(x)
boxplot(x$height ~ x$sample)

#multiple comparison of means
# 1- Tukey HSD. test
? agricolae
library(agricolae)

mod <- aov(height ~ sample, data= x)
output <- HSD.test(mod, "sample", group = TRUE, console = TRUE, main = "Tukey test")

plot(output)
#plot will show lettering

#LSD test
mod1 <- aov(height ~ sample, data= x)
output <- LSD.test(mod1, "sample", group = TRUE, console = TRUE, main = "Tukey test")
plot(output)

#Duncan test
mod2 <- aov(weight ~ sample, data= x)
output <- duncan.test(mod2, "sample", group = TRUE, console = TRUE, main = "duncan test")
plot(output)

#grouping
boxplot(height ~ sample * weight, data= x, las=2, xlab = "")

mod3 <- aov(height ~ sample * weight, data= x)
output <- HSD.test(mod3, "sample", group = TRUE, console = TRUE, main = "Tukey test")
plot(output, las= 1)

#how to save high quality graph
#1- jpeg
jpeg(file= "Tukey test plot.tiff",
     width=6, height= 4, units= "in", res= 600)
plot(output, las= 1)
dev.off()
