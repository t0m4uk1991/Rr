library(dplyr)
library(ggplot2)

cats <- read.csv("cats_sample.csv", 
                 dec = ",", 
                 stringsAsFactors=FALSE,
                 encoding = "UTF-8")

cats %>%
  filter(Sex == "F") %>%
  summarise(mean=median(Bwt))
  

cats %>%
  filter(Sex == "F") %>%
  summarise(mean=var(Bwt))

summary(as.numeric(filter(cats,Sex == "F")$Bwt))

mcats <- as.numeric(filter(cats, Sex == "M")$Bwt)
mean(mcats)
sqrt(var(mcats))

fcats <- as.numeric(filter(cats, Sex == "F")$Bwt)
mean(fcats)
sqrt(var(fcats))

