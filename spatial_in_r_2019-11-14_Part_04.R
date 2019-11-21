###----------
# Data Carpentry: Gesopatial Analysis in R
# UCSB Libraries
# 2019-11-14
###----------
# DATA FRAMES
###----------

gapminder <- read.csv("data/gapminder_data.txt")

str(gapminder)
str(gapminder$year)
class(gapminder$year)
class(gapminder$country)
length(gapminder)
gapminder[4]
class(gapminder)
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
colnames(gapminder)
head(gapminder)
tail(gapminder,12)

###----------
#  Challenge 1
###----------
### It’s good practice to also check the last few lines of your data and some in the middle. How would you do this?
### Searching for ones specifically in the middle isn’t too hard but we could simply ask for a few lines at random. How would you code this?
#----------

gapminder[sample(nrow(gapminder), 10), ]

###----------
#  Challenge 1
###----------
### Read the output of str(gapminder) again; this time, use what you’ve learned about factors and vectors, as well as the output of functions like colnames and dim to explain what everything that str prints out for gapminder means. If there are any parts you can’t interpret, discuss with your neighbors!
###----------

str(gapminder)

###----------
# ADDING COLUMNS AND ROWS IN DATA FRAMES
###----------

below_average <- gapminder$lifeExp < 70.5
below_average

below_avg_gap <- cbind(gapminder, below_average) # creates new data frame with TURE/FALSE column indicating whether the average life expectancy is below average or not

new_row <- list("Norway", 2013, 5000000, "Nordic", 80.3, 49400.0, FALSE)




###----------
# Challenge 3
###----------
# Make a data frame that holds the following information for yourself:

# first name
# last name
# lucky number
# Then use rbind to add an entry for the people sitting beside you. Finally, use cbind to add a column with each person’s answer to the question, “Is it time for coffee break?”
###----------

df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)