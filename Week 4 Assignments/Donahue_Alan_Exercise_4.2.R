#Assignment: Exercise 4.2
#Name: Donahue, Alan
#Date: 4 July 2021

#load libraries
library(ggplot2)

#setting the working directory
setwd("C:/Users/Alan Donahue/Documents/data science masters/DSC 520 Stats/GIT/dsc520")

#load the data
scores_df <- read.csv("data/scores.csv")

#Question 1a:
summary(scores_df)

head(scores_df)
#observational units: Count, Score, Section

#Question 1b: 
#Categorical: sports section, regular section
#Quantitative: course grades, total points

#Question 1c:
regularData <- subset(scores_df, scores_df$Section=="Regular")
sportsData <- subset(scores_df, scores_df$Section=="Sports")

#Question 1d:
ggplot(scores_df, aes(x=Score, y=Count)) + geom_col() + facet_wrap(~Section) + xlab("Total Scores") + ylab("Number of Students")

#1
#The regular section tended to score more points than the other section. I believe that is the case because
#the regular section has a negative skew, which means more students achieved a higher score. Meanwhile,
#the sports section has more of a normal distribution, which means there is more of a spread of scores.

#2
regularData$Score > sportsData$Score
#No every student in the Regular section did not score more points than the Sports section.
#A statistical tendency means that a student from the Regular section is more than likely to 
#score higher than a student in the sports section.

#3
#One variable that could be influencing the point distributions is whether or not a student enjoys sports.
#This can be important for a couple reasons. It could mean that smarter/harder working students might not
#enjoy sports so they took the regular section. Or it could mean that some students were forced to take the
#sports section when they don't like sports, so it affected their grades.

#Problem set 2
#load libraries
library(readxl)
library(plyr)
library(qqplotr)
library(pastecs)

#load the data
housing_list <- read_excel("data/week-6-housing.xlsx")

#question 1:
apply(housing_list[2], 2, median)

#question 2: 
aggregate(Sale_Price ~ bedrooms, housing_list, mean)

#question 3:
housing_df <- read.csv("data/week-6-housing.csv")
ddply(housing_df, .variables="bedrooms", FUN=min)

#question 4: 
ggplot(mapping = aes(sample = housing_df$Sale_Price)) + stat_qq_point(size = 2, color = "red") + stat_qq_line(color = "green")

#question 5:
housingSorted <- housing_df[order(housing_df$Sale_Price),]
tail(housingSorted)
ggplot(housing_df, aes(y=Sale_Price, x=1)) + geom_boxplot()

#question 6: 
housing_df$total_square_feet <- housing_df$square_feet_total_living * housing_df$sq_ft_lot
housing_df$total_toilets <- housing_df$bath_full_count + housing_df$bath_3qtr_count + housing_df$bath_half_count
