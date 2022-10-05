#import and combine file from COVID-19 submodule
library(here)
library(tidyverse)


Live <- read.csv(here("covid-19-data" , "live" , "us-counties.csv"))

Recent <- read.csv(here("covid-19-data" , "us-counties-recent.csv"))
Countys2022 <- read.csv(here("covid-19-data" , "us-counties-2022.csv"))
Countys2021 <- read.csv(here("covid-19-data" , "us-counties-2021.csv"))
Countys2020 <- read.csv(here("covid-19-data" , "us-counties-2020.csv"))

#combine data
Combine <- rbind(Countys2020, Countys2021, Countys2022, Recent, Live)


#filter data
PACounties <- filter(Combine, state == "Pennsylvania")

view(PACounties)

Lehigh <- filter(PACounties, county=="Lehigh")

#remove duplicate dates
LehighCases <- distinct(Lehigh, date,.keep_all = TRUE)

#find number of new cases at each date
n <- length(LehighCases$date)
LehighCases$incr_cases <- 0

for (i in 2:n)
{
  LehighCases$incr_cases[i] <- (LehighCases$cases[i]-LehighCases$cases[i-1])
}

view(LehighCases)

#graph data

p <- ggplot(data = LehighCases)

p + geom_line(color="blue", mapping = aes(x=date,
                                          y=incr_cases),
              group=1)+
  labs(x = "Date", y = "New Cases Reported",
       title = "COVID-19 Cases In Lehigh,PA")


