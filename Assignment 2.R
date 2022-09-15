# ASSIGNMENT 2


library(tidyverse)


#reading us-states.csv into dataframe

setwd("~/BIS-244-firestonepeter")


usstates <- read.csv("us-states.csv")

View(usstates)

options(max.print = 999999)


state <- "Pennsylvania"


#filter to see only Pennsylvania

pennsylvania <- filter(usstates,state=="Pennsylvania")



#set number length of the data set

number <- length(pennsylvania$date)


#create case/death variables

pennsylvania$incr_cases <- 4

pennsylvania$inc_deaths <- 1


#use variables to calculate changes in case/deaths

for (i in 2:number)
  
{pennsylvania$incr_cases[i] <- (pennsylvania$cases[i]-pennsylvania$cases[i-1])}

for (i in 2:number)
  
{pennsylvania$incr_deaths[i] <- (pennsylvania$deaths[i]-pennsylvania$deaths[i-1])}
  
View (pennsylvania)
#solve for standard deviation of incr_cases
  
sd(pennsylvania$incr_cases)








