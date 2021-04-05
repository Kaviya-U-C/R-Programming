###===================================================================================================###
###                                    INTRODUCTION TO R                                          ###
###                                        MODULE 3                                                  ###
###                                 [DESCRIPTIVE ANALYTICS]                                           ###                
###===================================================================================================###
#1. SUMMARIES AND STATISTICS
#=======================================================================================================

setwd("C:\\Users\\shiva\\Downloads")
cars <- read.csv("cars.csv")

#A. The summary() function
#gives us the six point summary 
#pandas describe function gave u information for missing value, spread, sd , etc and hence was more vast than R ka summary function 
#for numerical variable - 6 point summary, for categorical- frequency distribution
summary(cars$MPG)
summary(cars$Origin)
summary(cars)


#B. The by() / tapply() function
#by is similar to group by function of Python
?by
by(cars$Weight, cars$Origin, FUN=mean)
by(cars$Weight, cars$Origin, FUN=median)
by(cars$Weight, cars$Origin, FUN=sd)
by(cars$Weight, cars$Origin, FUN=summary)
#by and tapply are almost same,  just that by gives individual values and tapply gives values in a list

xyz =tapply(cars$Weight, cars$Origin, FUN=mean)
xyz[1]
abc[1]
abc = by(cars$Weight, cars$Origin, FUN=mean)
list(abc)

?tapply

#=======================================================================================================
#2. TABLES
#=======================================================================================================

table(cars$Origin)
table(cars$Cylinders)
table(cars$Origin,cars$Cylinders)

#tables of proportions
prop.table(table(cars$Origin))

#table of percentages- rounded to 2 decimal places
round(prop.table(table(cars$Origin))*100,2)

#table of joint probabilities
round(prop.table(table(cars$Origin, cars$Cylinders)),4)

#Table of conditional probabilities (conditioned on rows)
round(prop.table(table(cars$Origin, cars$Cylinders),1),3)


#Table of conditional probabilities (conditioned on columns)
round(prop.table(table(cars$Origin, cars$Cylinders),2),3)



#=======================================================================================================
#3. HISTOGRAMS
#=======================================================================================================

hist(cars$MPG)
hist(cars$MPG, xlab= 'Miles per Gallon', ylab = 'No of cars', 
     main = 'Histogram of MPG')
hist(cars$MPG, xlab = 'Miles per Gallon', ylab = 'No of cars', 
     main = 'Histogram of MPG', col = 'orange', border = F)

?hist



#=======================================================================================================
#4. BOXPLOTS
#=======================================================================================================
boxplot(cars$MPG)
boxplot(cars$MPG, horizontal = T, xlab ='frequency' ,ylab= 'Boxplot of MPG' )
boxplot(cars$MPG, horizontal = T )

?boxplot


#=======================================================================================================
#5. BAR CHARTS
#=======================================================================================================

barplot(table(cars$Cylinders))
barplot(prop.table(table(cars$Cylinders)))





#=======================================================================================================
#6. SCATTERPLOTS AND PAIRWISE SCATTERPLOTS
#=======================================================================================================

plot(cars$Weight, cars$MPG, pch =20)
plot(cars$Weight, cars$MPG, pch =1)

plot(subset(cars, select = MPG:Horsepower))


