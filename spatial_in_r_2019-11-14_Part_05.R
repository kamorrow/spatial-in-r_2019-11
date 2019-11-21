###----------
# Data Carpentry: Gesopatial Analysis in R
# UCSB Libraries
# 2019-11-15
###----------
# REVIEW
###----------
library(tidyverse)
library(here)
library(janitor)

gapminder <- read.csv(here::here("data", "gapminder_data.txt"))
nordic <- read.csv(here::here("data", "nordic-data.txt"))

class(gapminder)
dim(gapminder)
gapminder[sample(nrow(gapminder),10), ] #returns n random rows from data set
gapminder[sample(nrow(gapminder),10), ]

nordic[1] # returns first col
class(nordic[1]) # data frame - a list

nordic[[1]] # returns items in first col
class(nordic[[1]]) # factor

nordic$country # returns items in first col
class(nordic$country) # factor

nordic["country"] # returns first col, like using an index number on line 20
class(nordic["country"]) # data.frame - a list

nordic[1, 1] # returns first item in first col plus possible items in first col
class(nordic[1, 1]) # factor

nordic[, 1] # returns first col
class(nordic[, 1]) # factor

nordic[1, ] # returns first row
class(nordic[1, ]) # data.frame

###----------
# DATA FRAME MANIPULATION WITH dplyr
###----------
# dplyr is part of the tidyverse

mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
mean(gapminder[gapminder$continent == "Americas", "gdpPercap"])
mean(gapminder[gapminder$continent == "Asia", "gdpPercap"])

###----------
# PIPES
###----------

year_country <- gapminder %>%
  select(year, country, gdpPercap)

# Challenge 1
africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(lifeExp, country, year)

africa[sample(nrow(africa), 10), ]

###----------
# SUMMARIZE
###----------

continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gsp_per_cap = mean(gdpPercap))

###----------
# Challenge 2
###----------

# Calculate the average life expectancy per country. Which has the longest average life expectancy and which has the shortest average life expectancy?

life_exp <- gapminder %>%
  group_by(country) %>%
  summarize(mean_life_exp = mean(lifeExp))

life_exp %>%
  filter(mean_life_exp == min(mean_life_exp) |
           mean_life_exp == max(mean_life_exp))

###----------
# COUNT
###----------

count_2002 <- gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)

count_2002

gapminder %>%
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))

###----------
# MUTATE
###----------

gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion = gdpPercap*pop/10^9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))

###----------
# GGPLOT2
###----------
library(ggplot2)


###----------
# Histogram
###----------

ggplot(data = gapminder, aes(x = lifeExp)) +
  geom_histogram(fill = "blue", color = "black", alpha = 0.5) +
  labs( x = "life expectancy (years)",
        y = "",
        title = "Global life expectancy",
        subtitle = "(Morrow)") +
  theme_minimal()

###----------
# Challenge 1
###----------

ggplot(data = gapminder, aes(x = gdpPercap)) +
  geom_histogram(fill = "green", color = "black", alpha = 0.5) +
  labs( x = "GDP per capita",
        y = "",
        title = "Global GDP per capita",
        subtitle = "(Morrow)") +
  theme_minimal()

###----------
#  Column
###----------

gapminder_Americas <- filter(gapminder,
                             year == 2007,
                             continent == "Americas")

ggplot(data = gapminder_Americas, aes(x = country, y= gdpPercap)) +
  geom_col() +
  theme_minimal() +
  coord_flip()

# ###----------
# # SAVE AS PDF
# ###----------
pdf("Distribution-of-gdpPercap.pdf", width=12, height=4)
ggplot(data = gapminder, aes(x = gdpPercap)) +   
  geom_histogram()

# You then have to make sure to turn off the pdf device!

dev.off()

pdf("Distribution-of-gdpPercap.pdf", width = 12, height = 4)
ggplot(data = gapminder, aes(x = gdpPercap)) + 
  geom_histogram()

ggplot(data = gapminder_small_2, aes(x = country, y = gdpPercap, fill = as.factor(year))) +
  geom_col(position = "dodge") + coord_flip()

dev.off()

###----------
# Challenge 2
###----------

gap_1952_2007 <- gapminder %>%
  filter(year %in% c(1952, 2007),
         continent == "Americas")

ggplot(data = gap_1952_2007, aes(x = country,
                                 y = gdpPercap,
                                 fill = as.factor(year))) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(x = "Country",
       y = "GDP per Capita",
       title = "GDP Per Capita by Year",
       subtitle = "Americas") +
  coord_flip()

###----------
# SAVING A CSV
###----------
gap_aus <- gapminder %>%
  filter(country == "Australia")

write.csv(gap_aus, here::here("data","australia_gapminder.csv"))


