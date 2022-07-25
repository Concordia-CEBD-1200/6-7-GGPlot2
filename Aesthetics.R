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
         size = Genre
       )) + geom_point()

# Add Better Size
ggplot(data = movies,
       aes(
         x = CriticRating,
         y = AudienceRatings,
         color = Genre,
         size = BudgetMillions
       )) + geom_point()
