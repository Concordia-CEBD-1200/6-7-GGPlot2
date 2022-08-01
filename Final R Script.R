# ***Data***
movies <- read.csv("Movie-Ratings.csv", stringsAsFactors = T)

colnames(movies) <-
  c("Film",
    "Genre",
    "CriticRating",
    "AudienceRatings",
    "BudgetMillions",
    "Year")

factor(movies$Year)
movies$Year <- factor(movies$Year)

# ***Aesthetics***
library(ggplot2)

ggplot(data = movies, aes(x = CriticRating, y = AudienceRatings))
# Add Geometry
ggplot(data = movies, aes(x = CriticRating, y = AudienceRatings)) + geom_point()
# Add Color
ggplot(data = movies, aes(x = CriticRating, y = AudienceRatings, color = Genre)) + geom_point()
# Add Size
ggplot(data = movies,
       aes(
         x = CriticRating,
         y = AudienceRatings,
         color = Genre,
         size = BudgetMillions
       )) + geom_point()

# ***Geometry***
p <- ggplot(data = movies,
            aes(
              x = CriticRating,
              y = AudienceRatings,
              color = Genre,
              size = BudgetMillions
            ))
p
# *Plotting with layers*

# point
p + geom_point()

# line
p + geom_line()

# multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()









