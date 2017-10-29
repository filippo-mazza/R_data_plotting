
library(GGally)
library(ggplot2)

#diamond data set is in ggplot2
GGally::ggpairs(diamonds[1:10])

#The prices have a strong long tail distribution
qplot(diamonds$price)


#Checking the prices distribution by cut and color
ggplot(data=diamonds, aes(x=price))+geom_histogram()+facet_grid(diamonds$cut ~ diamonds$color)

#There is a stratification of cuts depending on the table variable
ggplot(data=diamonds, aes(y=price,x=table,colour=cut)) + geom_point() + scale_color_brewer(breaks = diamonds$cut, type = 'qual')

#Simple analysis by (simple computation) of volume
diamonds$volume = diamonds$x * diamonds$y * diamonds$z
tmp <- diamonds[diamonds$volume<quantile(diamonds$volume,c(.99)),]
ggplot(data=tmp, aes(y=price,x=volume,colour=clarity)) + geom_point() + scale_color_brewer(type = 'div') + scale_y_log10()


ggplot(diamonds,aes(table,price))+stat_summary(fun.y=median, geom="line")


#Scatter plot of price/carat vs cut by clarity + col by ... color
ggplot(diamonds, aes(x=cut, y=price/carat,colour=color)) +
  geom_point(size=2) + facet_grid(diamonds$clarity ~.)
