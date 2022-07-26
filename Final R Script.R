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

# *** Overriding Aesthetics ***
q <- ggplot(data = movies,
            aes(
              x = CriticRating,
              y = AudienceRatings,
              color = Genre,
              size = BudgetMillions
            ))
# Add geom layer
q + geom_point()
# *Overriding aes*

# ex1
q + geom_point(aes(size = CriticRating))

# ex2
q + geom_point(aes(color = BudgetMillions))

# q is unchanged
q + geom_point()

# ex4
q + geom_point(aes(x = BudgetMillions)) + xlab("Budget Millions $$$")

# ex5 - reduce line size
q + geom_line(size = 1) + geom_point()

# ***Mapping vs Setting***

r <-
  ggplot(data = movies, aes(x = CriticRating, y = AudienceRatings))
r + geom_point()

# Add color - 1. Mapping
r + geom_point(aes(color = Genre))
# Add color - 1. Setting
r + geom_point(color = "DarkGreen")
# error
# r + geom_point(aes(color = "DarkGreen"))

# 1. Size - Mapping
r + geom_point(aes(size = BudgetMillions))
# 2. Size - Setting
r + geom_point(size = 10)
# error
r + geom_point(aes(size = 10))

# ***Histograms and Density Charts***

s <- ggplot(data = movies, aes(x = BudgetMillions))
s + geom_histogram(binwidth = 10)

# add colour
s + geom_histogram(binwidth = 10, aes(fill = Genre))
# add a border
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

# very rarely used
s + geom_density(aes(fill = Genre))
s + geom_density(aes(fill = Genre), position = "stack")


# ***Starting Layer Tips***
t <- ggplot(data = movies, aes(x = AudienceRatings))
t + geom_histogram(binwidth = 10,
                   fill = "White",
                   color = "blue")

# Another way
t <- ggplot(data = movies)
t + geom_histogram(
  binwidth = 10,
  aes(x = AudienceRatings),
  fill = "White",
  color = "blue"
)

t + geom_histogram(
  binwidth = 10,
  aes(x = CriticRating),
  fill = "White",
  color = "blue"
)

# ***Statistical Transformations***

? geom_smooth
u <-
  ggplot(data = movies, aes(x = CriticRating, y = AudienceRatings, color =
                              Genre))

u + geom_point() + geom_smooth()
u + geom_point() + geom_smooth(fill = NA)

# boxplot
u <-
  ggplot(data = movies, aes(x = Genre, y = AudienceRatings, color = Genre))

u + geom_boxplot()
u + geom_boxplot(size = 1.2) + geom_point()

# tip / hack
u + geom_boxplot(size = 1.2) + geom_jitter()
u + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)


# ***Using Facets***

v <- ggplot(data = movies, aes(x = BudgetMillions))
v + geom_histogram(binwidth = 10)
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

# facets
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  facet_grid(Genre ~ ., scales = "free")

# scatterplots
w <-
  ggplot(data = movies, aes(x = CriticRating, y = AudienceRatings, color = Genre))
w + geom_point(size = 3)

# facets
w + geom_point(size = 3) + facet_grid(Genre ~ .)
w + geom_point(size = 3) + facet_grid(. ~ Year)
w + geom_point(size = 3) + facet_grid(Genre ~ Year) + geom_smooth()

w + geom_point(aes(size = BudgetMillions))  +
  geom_smooth() +
  facet_grid(Genre ~ Year)

# ***Coordinates***
# limits

m <-
  ggplot(data = movies,
         aes(
           x = CriticRating,
           y = AudienceRatings,
           size = BudgetMillions,
           color = Genre
         ))
m + geom_point()

m + geom_point() + xlim(50, 100) + ylim(50, 100)

# won't always work well

n <- ggplot(data = movies, aes(x = BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")
n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") + ylim(0, 50)

# zoom

n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  coord_cartesian(ylim = c(0, 50))

# Improving w
w + geom_point(aes(size = BudgetMillions))  +
  geom_smooth() +
  facet_grid(Genre ~ Year) +
  coord_cartesian(ylim = c(0, 100))

# *** Theme***
x <- ggplot(data = movies, aes(x = BudgetMillions))
h <-
  x + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")

# Axes labels
h + xlab("Money Axis") + ylab("Number of Movies")

# Label formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(
    axis.title.x = element_text(color = "DarkGreen", size = 30),
    axis.title.y = element_text(color = "Red", size = 30)
  )

# Tick mark formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(
    axis.title.x = element_text(color = "DarkGreen", size = 30),
    axis.title.y = element_text(color = "Red", size = 30),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20)
  )

? theme

# Legend formatting

h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(
    axis.title.x = element_text(color = "DarkGreen", size = 30),
    axis.title.y = element_text(color = "Red", size = 30),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20),
    legend.title = element_text(size = 30),
    legend.text = element_text(size = 20),
    legend.position = c(1, 1),
    legend.justification = c(1, 1)
  )

# Title
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribtion") +
  theme(
    axis.title.x = element_text(color = "DarkGreen", size = 30),
    axis.title.y = element_text(color = "Red", size = 30),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20),
    legend.title = element_text(size = 30),
    legend.text = element_text(size = 20),
    legend.position = c(1, 1),
    legend.justification = c(1, 1),
    plot.title = element_text(color="DarkBlue", size = 40, family = "Courier")
  )
