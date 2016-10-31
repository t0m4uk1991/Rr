#install.packages('dplyr', dependencies = TRUE)
#install.packages('ggplot2', dependencies = TRUE)

library(dplyr)
library(ggplot2)

setwd("/home/atom/git/Rr")
flats <- read.csv("flats.csv", 
                  stringsAsFactors=FALSE, 
                  encoding="UTF-8",
                  dec = ",")
class (flats)
str(flats)
dimensions <- dim(flats)
table_head <- head(flats,6)

summary(flats)
glimpse(flats)

count(flats, Місто)

flats %>%
  count(Місто) %>%
  arrange(n)


flats %>%
  filter(Кімнат == 3) %>%
  filter(Місто == "Одеса") %>%
  count(Місто)

flats %>%
  filter(Кімнат == 1) %>%
  filter(Місто == "Львів") %>%
  summarise(mean=median(Загальна_площа))

ggplot(flats, aes(x=Кімнат)) +
       geom_bar(fill="lightblue",col="grey") + 
       ylab('Кількість')

ggplot(flats, aes(x=Загальна_площа)) +
       geom_bar(fill="lightblue",col="grey") + 
       ylab('Кількість')


ggplot(flats, aes(x=Загальна_площа)) +
       geom_histogram(fill="lightblue",col="grey", breaks=seq(0, 250, by=50)) + 
       ylab('Кількість')

ggplot(flats, aes(x=Загальна_площа,y=Ціна)) + geom_point()

ggplot(flats, aes(x=Місто,y=Ціна)) + 
  geom_boxplot() + 
  coord_flip()