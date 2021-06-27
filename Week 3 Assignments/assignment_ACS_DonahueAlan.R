#Assignment: Exercise 3.2
#Name: Donahue, Alan
#Date: 27 June 2021

#Load packages
library(ggplot2)
library(qqplotr)
library(pastecs)
theme_set(theme_minimal())

#setting the working directory
setwd("C:/Users/Alan Donahue/Documents/data science masters/DSC 520 Stats/GIT/dsc520")

#load the data 
acs_df <- read.csv("data/acs-14-1yr-s0201.csv")

#Question 1
#Categories: Id, Id2, Geography, PopGroupID, POPGROUP.display.label, RacesReported, HSDegree, BachDegree
#Data types: char, int, num

#Question 2: ouput for str(), nrow(), and ncol()
str(acs_df)
nrow(acs_df)
ncol(acs_df)

#Question 3: histogram of the HSDegree variable
ggplot(acs_df, aes(x=HSDegree)) + geom_histogram(bins = 20) + ggtitle("High School Degrees") + xlab("Percentage HS Degree Complete") + ylab("Number of Counties")

#Question 4: Histogram with normal curve
#4a) Yes, the data distribution is unimodal because it has one hump
#4b) No, it is not approximately symmetrical
#4c) Yes, it is approximately bell-shaped
#4d) No, it is not approximately normal
#4e) Yes the distribution is skewed. It has negatively skewed distribution
#4f)
hist.hs <- ggplot(acs_df, aes(x=HSDegree)) + geom_histogram(aes(y = ..density..), color = "black", fill = "white", bins = 20) + ggtitle("High School Degrees") + xlab("Percentage HS Degree Complete") + ylab("Number of Counties")
hist.hs + stat_function(fun = dnorm, args = list(mean = mean(acs_df$HSDegree, na.rm = TRUE), sd = sd(acs_df$HSDegree, na.rm = TRUE)), color = "red", size = 1)
#4g) No a normal distribution cannot be accurately used for this model because it is negatively skewed
# A normal distribution would not fit the model.


#Question 5: Probability Plot
ggplot(mapping = aes(sample = acs_df$HSDegree)) + stat_qq_point(size = 2, color = "red") + stat_qq_line(color = "green")

#Question 6
#6a) No, the distribution is not approximately normal because the dots aren't in a straight line, which represents a normal distribution.
#6b) It is negatively skewed because the qqplot is left skewed which indicates a negative skew.

#Question 7 stat.desc() function
stat.desc(acs_df$HSDegree, basic = FALSE, norm = TRUE)

#Question 8
#For values of skew and kurtosis, if they are zero, then it means there is a normal distribution. 
#However, the skew for this example is negative, which means that there is going to be more information on the right side of the graph.
#This example also had a positive value for kurtosis, which means that there is a pointy, heavy-tailed distribution.
#Additionally, the further away the kurtosis value is from zero, the more likely it is not a normal distribution.
#As a sample size increases, the small deviations from normality can cause significant values. So, if the sample size is
#large enough, it might be better to look at the value for skew and kurtosis than rather calculate their significance. 

