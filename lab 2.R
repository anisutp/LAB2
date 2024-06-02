#act1
library(tidyverse)
library(dplyr)
library(dlookr)
library(desc)

install.packages("dlookr")
install.packages("dplyr")
install.packages("stringi")


getwd()

setwd("C:/Users/airne/Downloads") 
#bagi die punya slash die terbalik dulu

list.files()

#boleh jgk buat yg churn = as variable and letak je directory of the files
churn = read.csv('churn_train.csv', head = TRUE)

#act1.3
#to calculate descriptive statistics
descriptive_stats <- describe(churn)
print(descriptive_stats)

#test of normality - if p value <0.05, the dat does not follow normal distribution
normality_test <- normality(churn)
print(normality_test)

#visualization of normality
plot_normality(churn)

#act1.4
#calculation of correlation coefficient using correlate - to see the relationship between the variables
#if it goes towards 1, the correlation between the variables is strong (like twin - they are identical)
#-ve correlation = no correlation between the variables
correlation_matrix <- correlate(churn)
print(correlation_matrix)

#visualization the correlation plot
plot_correlate(correlation_matrix)

#act1.5

#Grouping data by internet service
categ <- target_by(churn,Internet.Service)
#analyzing 
cat_num <- relate(categ, Tenure)
summary(cat_num)

plot(cat_num)

install.packages('vcd')
library(vcd)
mosaic(Internet.Service ~ Gender, data = churn)


#act 2
#create static EDA report
eda_paged_report(churn)

#create static EDA report - in webpage
eda_web_report(churn)
