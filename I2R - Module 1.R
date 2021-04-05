###===================================================================================================###
###                                     Introduction to R                                          ###
###                                         MODULE 1                                          ###
###                                    [DATA AND VECTORS]                                             ###                
###===================================================================================================###
#1. READING THE CARS.CSV DATA IN R
#=======================================================================================================

getwd()                                 #get the working directory
setwd("C:\\Users\\shiva\\Downloads")  #set the working directory
cars = read.csv("cars.csv")             #read the data


#========================================================================================================
#2. SOME INITIAL STEPS WITH DATA
#========================================================================================================
#A. Checking the dimension of the data
dim(cars)

#B. Number of rows of the data
nrow(cars)

#C. Number of columns of the data
ncol(cars)

#D. Studying the Structure of the data
str(cars)

#E. Printing first and last few lines of a data
head(cars)
tail(cars)
tail(cars,3)

#F. Viewing the entire data
View(cars)


#========================================================================================================
#3. INTRODUCTION TO VECTORS
#========================================================================================================



v <- 5 #assignment symbol
v=5
v+1

#R is case sensitive 
V #uppercase V 

#A. Defining a vector

x <- c(12,34,24,45,7,18) # c stands for combine
  x

#B. Generating regular sequences - The colon [:] operator
30:50
50:30
  

#C. Generating regular sequences - The seq() function
seq(1,20,3)
seq(0,1,length.out = 10)

#D. Renerating simple random sample
sample(1:10,3) #by default replace = TRUE
sample(1:10,3, replace=T) #simple random sampling without replacement
sample(1:10,3,replace=F) #simple random sampling with replacement
?sample #Help for sample 

sample(0:1,10, replace =T, prob = c(0.2,0.8))

#========================================================================================================
#4. SOME USEFUL FUNCTIONS
#========================================================================================================

#A. sum()
sum(x)

#B. mean(), median(), sd(), var()


#C. max(), min()


#D. quantile()
quantile(x,0.75)
quantile(x,0.25)
quantile(x,0.90)
?quantile
quantile(x, c(0.5,0.9,0.99))



#E. length()
length(x)

#F. summary
summary(x) #6 point summary most used function in 



#========================================================================================================
#5. VECTOR SUBSETTING
#========================================================================================================

#the first index in R starts from 1 and last number is included in it 
x
x[1]
x[c(1,3)]

#The conditional operators

# > is greater than
# < is less than
# == is equal to
# <= is less than or equal to
# >= is greater than or equal to

x
x > 20
x == 24


#and - &
#or - |

(x>30 | x<10)
(x<30 & x >10)


#PROBLEM:
#Consider the following two vectors

x <- c(33,45,23,67,54,48)
y <- c(108,151,164,119,135,122)

x
y


#Write a R code to find the folowing solutions
# a. Values of x that are less than 35
x[x<35]



# b. The number of observations in y that are more than 150
y[y>150]
length(y[y>150])
#alternative method 
sum(y>150) #adding the vector of Trues and Falses


# c. The number of observations in y that are between 120 and 165

sum(y>=120 & y<=165)


# d. The vaues in x that are less than 30 or greater than 50
x[x<30 | x >50]


# e. The values in x for which the values in y is less than or equal to 120
x[y<=120]



# f. The values in y for which the values in x is equal to 45
y[x == 45]



#========================================================================================================
#6. VECTORS IN DATA
#========================================================================================================

#Note that in a data set each rows or columns is nothing but a vector
#A variable in data can be extracted as follows:
View(cars)
mean(cars$MPG)
summary(cars$MPG)


#PROBLEM (Reference: cars.csv)

# a. Which car has the highest mpg?
z = max(cars$MPG)
subset(cars, MPG == z)
cars$Car[max(cars$MPG)]

cars$Car[cars$MPG == max(cars$MPG)] ##sir



# b. Which car is the heaviest?
z = max(cars$Weight)
subset(cars, Weight == z)
?subset
cars$Car[max(cars$Weight)]#sir 


cars$Car[cars$Weight == max(cars$Weight) ] #sir 

# c. Which car is the lightest?
z = min(cars$Weight)
subset(cars, Weight == z)

cars$Car[cars$Weight == min(cars$Weight) ] #sir 


cars$Car[min(cars$Weight)]

# d. Which car has the highest value of the horsepower?
z = max(cars$Horsepower)
subset(cars, Horsepower == z)
cars$Car[max(cars$Horsepower)]

cars$Car[cars$Horsepower == max(cars$Horsepower)]##sir


# e. What is the lowest value of the horsepower?
z = min(cars$Horsepower)
z


# f. What is the highest values of the mpg?
z = max(cars$MPG)
z


# g. List the top 10 percentile values of mpg.
cars$MPG[quantile(cars$MPG,0.1)]
quantile(cars$MPG, seq(0.9,0.99,0.01)) ##sir


# h. List the name of cars which has mileage between 25 and 35 mpg.
a = cars$MPG

cars$Car[cars$MPG > 25 | cars$MPG<35] ##sir


# i. What is the average weight of the cars which has 8 cylinders?
mean(cars$Weight[cars$Cylinders == 8]) ##sir


# j. What is the average weight of the cars that are originated in Japan?
mean(cars$Weight[cars$Origin == 'Japan']) ##sir


# k. Randomly select 20 cars from the given list of cars.
sample(cars$Car, 20) ##sir












