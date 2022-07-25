getwd()
setwd("C:\\Users\\Pranav Bhatia\\Documents\\Github\\R\\6-7-GGPlot2")

movies <- read.csv("Movie-Ratings.csv", stringsAsFactors = T)
head(movies)

colnames(movies) <-
  c("Film",
    "Genre",
    "CriticRating",
    "AudienceRatings",
    "BudgetMillions",
    "Year")

head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)

str(movies)
summary(movies)
