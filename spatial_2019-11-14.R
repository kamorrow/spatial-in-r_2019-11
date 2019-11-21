###----------
# Data Carpentry: Gesopatial Analysis in R
# UCSB Libraries
# 2019-11-14
###----------

# library(dplyr)
# library(tidyverse)
# library(raster)
# library(rgdal)
# library(rasterVis)
# library(remotes)
# library(sf)

mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20

ab_vector <- c("a", "b")
combine <-  c(ab_vector, "c", "d")

series <- 1:10

###----------
# Naming Vectors
###----------

letters_ex <- 1:26 # create vector of numbers one through twenty-six
letters_ex <- letters_ex * 2 # multiply every  number by 2
names(letters_ex) <- LETTERS # use built-in vector of uppercase letters A through Z to name items in letters_ex
letters_ex # call vector

letters_ex2 <- 1:15 # create vector of numbers one through twenty-six
letters_ex2 <- letters_ex2 * 2 # multiply every  number by 2
names(letters_ex2) <- LETTERS[1:15] # use built-in vector of uppercase letters A through Z to name items in letters_ex, constraining to length of letters_ex2
letters_ex2 # call vector

###----------
# 
###----------

nordics <-  c("Denmark", "Sweden", "Norway", "Iceland", "Finland")
categories <- factor(nordics)
