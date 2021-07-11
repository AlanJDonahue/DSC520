#Assignment: Exercise 5.2
#Name: Donahue, Alan
#Date: 11 July 2021


#load libraries
library(dplyr)

#setting the working directory
setwd("C:/Users/Alan Donahue/Documents/data science masters/DSC 520 Stats/GIT/dsc520")

#load the data
housing_df <- read.csv("data/week-6-housing.csv")

#understanding the data
head(housing_df)
str(housing_df)
nrow(housing_df)
ncol(housing_df)

#Question 1A) GroupBy
housing_df %>% group_by(zip5) %>% summarize(AvgPrice=mean(Sale_Price))
group_by(housing_df, year_built)
group_by(housing_df, ctyname)

#Question 1A) Summarize
summarize(housing_df, mean(Sale_Price))
housing_df %>% group_by(Sale.Date) %>% summarize(AvgPrice=mean(Sale_Price))
housing_df %>% group_by(year_built) %>% summarize(AvgPrice=mean(Sale_Price)) #1909 had an interesting avg

#Question 1A) Mutate
housing_df %>% select(Sale_Price, square_feet_total_living) %>% mutate(Cost_per_sqft=Sale_Price/square_feet_total_living)

#Question 1A) Filter
housing_df %>% filter(year_built == '1909')
housing_df %>% filter(zip5 == '98053')
housing_df %>% filter(Sale_Price < 100000)

#Question 1A) Select
housing_df %>% select(Sale_Price, bedrooms) %>% head()
housing_df %>% select(Sale_Price, ctyname, zip5) %>% head()

#Question 1A) Arrange
housing_df %>% group_by(zip5) %>% summarize(AvgPrice=mean(Sale_Price)) %>% arrange(AvgPrice)
housing_df %>% group_by(year_built) %>% summarize(AvgPrice=mean(Sale_Price)) %>% arrange(AvgPrice)
housing_df %>% group_by(building_grade) %>% summarize(AvgPrice=mean(Sale_Price)) %>% arrange(AvgPrice)

#load library
library(purrr)
library(stringr)

#Question 1B) 2 purrr functions
limited_housing <- keep(housing_df$Sale_Price, function(x) x < 100000)
limited_housing

housing_df$zip5 %>% discard(housing_df$zip5==98059)

#Question 1C) cbind / rbind function
dataset1 <- cbind(housing_df$Sale_Price, housing_df$zip5, housing_df$square_feet_total_living)
dataset1

dataset2 <- cbind(housing_df$bedrooms, housing_df$bath_full_count, housing_df$bath_half_count)
dataset2

dataset3 <- rbind(dataset1, dataset2)
dataset3

#Question 1D) split a string
my_string <- "Here we lie mistake in the world mistake of joy."
split_string <- str_split(my_string, pattern="mistake")
split_string
