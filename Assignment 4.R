#Assignment 4


library(gapminder)
library(here)
library(tidyverse)
library(socviz)
library(gridExtra)

#data set
library(readr)
wot <- read.csv("WOT.csv")


#dial to tanks used more than 3 times
WOT_updated <- filter(WOT, Battles > 3)

WOT_updated$WR <- sub("%", "", WOT_updated$WR)
WOT_updated$WR <- as.numeric(WOT_updated$WR)

p <- ggplot(data = WOT_updated,
        mapping = aes(x = reorder(Nation, WR, na.rm=TRUE), y = WR))

plot_a <- p + geom_boxplot() +
  labs(x = "Nation Palayed",
       y= "Win Rate (WR)",
       title = "States By Nation Played")

q <- ggplot(data = WOT_updated,
            mapping = aes(x = reorder(Class, WR, ma.rm=TRUE),y = WR))

plot_b <- q + geom_boxplot() + 
  labs(x = "Nation Played",
       y = "Win Rate (WR)",
       title = "Statistics By Type Played")

install.packages("gridExtra")
gridExtra::grid.arrange(
  plot_a,
  plot_b,
  ncol = 2
)