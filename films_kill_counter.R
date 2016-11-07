library(dplyr)
library(ggplot2)

body_counter <- read.csv("filmdeathcounts.csv")

head(body_counter)

body_counter$killed_per_minute <- body_counter$Body_Count / body_counter$Length_Minutes

head(body_counter)

ggplot(body_counter, aes(x=Body_Count)) +
    geom_histogram(bins=20, color="grey", fill="lightblue")

body_counter %>%
  top_n(n = 10, Body_Count) %>%
  arrange(desc(Body_Count))


body_counter %>%
  top_n(n = 10, killed_per_minute) %>%
  arrange(desc(killed_per_minute))


ggplot(body_counter, aes(x=IMDB_Rating)) +
  geom_histogram(bins=10, color="grey", fill="lightblue")


imdb_mean <- mean(body_counter$IMDB_Rating)
imdb_sd <- sqrt(var(body_counter$IMDB_Rating))

set.seed(900)
fake_data <- rnorm(n=nrow(body_counter), mean = imdb_mean, sd = imdb_sd)

body_counter$imdb_simulation <- fake_data

ggplot(body_counter, aes(x=imdb_simulation)) +
  geom_histogram(bins=10, color="grey", fill="lightblue")

ggplot(body_counter, aes(sample=imdb_simulation)) + 
  stat_qq()

ggplot(body_counter, aes(sample=IMDB_Rating)) + 
  stat_qq()

ggplot(body_counter$IMDB_Rating, aes(body_counter$IMDB_Rating))


z4 <- (4.0 - imdb_mean) / imdb_sd
pnorm(z4)

z <- (4.0 - imdb_mean) / imdb_sd
pnorm(z,lower.tail = FALSE)

z8 <- (8.0 - imdb_mean) / imdb_sd
pnorm(z8,lower.tail = TRUE)