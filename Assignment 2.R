# ASSIGNMENT 2


library(tidyverse)


#reading us-states.csv through alternative method, library(here)
 
library(here)

<<<<<<< HEAD
usstates <- read.csv(here("covid-19-data","us-states.csv"))
=======
setwd("~/BIS-244-firestonepeter")
#No need to set directory if your RProject is in the same directory as your repository

usstates <- read.csv("us-states.csv")
>>>>>>> main

usstates <- read.csv(here("covid-19-data","us-states.csv")) # correct way to read csv for future reference

View(usstates)

options(max.print = 999999)

state <- "pennsylvania"


#filter to see only Pennsylvania

pennsylvania <- filter(usstates,state=="Pennsylvania")



#set number length of the data set

n <- length(pennsylvania$date)


#create case/death variables

#You can also initiate Incr_cases with 2 or 1 as given in the dataset
pennsylvania$incr_cases <- 4

pennsylvania$incr_deaths <- 1


#use variables to calculate changes in case/deaths

for (i in 2:n)
  
{pennsylvania$incr_cases[i] <- (pennsylvania$cases[i]-pennsylvania$cases[i-1])}

for (i in 2:n)
  
{pennsylvania$incr_deaths[i] <- (pennsylvania$deaths[i]-pennsylvania$deaths[i-1])}
  
View (pennsylvania)
#solve for standard deviation of incr_cases
  
sd(pennsylvania$incr_cases)