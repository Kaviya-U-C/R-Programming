###===================================================================================================###
###                                      INTRODUCTION TO R                                           ###
###                                          MODULE 4                                           ###
###                                    [DATA MANIPULATION]                                            ###                
###===================================================================================================###
#1. The class() function
#=======================================================================================================
x <- 5.6
class(x)

x <- 5
class(x)

b <- c(1,2,3)
class(x)

mtcars
class(mtcars)

#=======================================================================================================
#2. Class conversion
#=======================================================================================================

setwd("C:\\Users\\shiva\\Downloads")
cars <- read.csv("cars.csv")

str(cars)

class(cars$Horsepower)
cars$Horsepower <- as.numeric(cars$Horsepower)

cars$Model <- as.numeric(cars$Model)


#=======================================================================================================
#3. Sort & Order
#=======================================================================================================

#A. Sort the variable Acceleration in ascending order

cars$Acceleration
sort(cars$Acceleration)
sort(cars$Acceleration, decreasing = T)
sort(cars) #entire data frame will give an error pass a purticular column instead
?sort


#B. Sort the variable Weight in Decsending Order




#C. Sort the data by MPG in increasing order

acc <- cars$Acceleration
acc.order <- order(cars$Acceleration)

for (i in 1:10)
  print(acc[acc.order == i])

x <- c(4,2,8,1)
order(x) #returns index positions of elements in ascending order(1 is at position 4, 
# 2 is at position 2
# 4 is at position 1
# 8 is at position 3)

x[4]
x[2]

x[order(x)]  #rearranging the elements of x 
x[c(4,2,1,3)]
order(-x) #orders in descending order

sort(cars$Acceleration)
cars$Acceleration[order(cars$Acceleration)]

View(cars[order(cars$Acceleration),])
View(cars[order(-cars$Acceleration),]) #inside order if u give a negative sign, so orders on descending order 


#D. Sort the data by MPG in increasing order and then sort by Origin
View(cars[order(cars$Origin, cars$MPG),]) #Starts with least value of MPG then max MPG in Europe, next Min MPG Japan to Max MPG Japan
cars[order(cars$Origin, -cars$MPG),]



#E. Sort the data by Cylinders and then by MPG




#F. Sort the data by MPG in ascending order and by cylinder in descending order





#=======================================================================================================
#4. Data Transformation
#=======================================================================================================

# Plot a scatter plot between MPG and weight. Comment of the linearity.
plot(cars$Weight, cars$MPG)



# Re-plot the scatter plot by taking the log transformation of both the variables. Does the linearity 
# Improve?
plot(log(cars$Weight), log(cars$MPG)) #give more linear relationship than one above
cor(log(cars$Weight), log(cars$MPG)) #returns NaN


#log(MPG) = a+b*log(Weight)
#log(MPG) -> MPG(take antilog)



# But there is a problem! Check the summary of log(MPG). What do you observe?
summary(log(cars$MPG)) #mean is -infinity



# Can you identify where we got mislead? Probably the answer lies in the summary of MPG.
summary(cars$MPG) #MIN is 0 so log(0) is -Infinity
log(0)
#So should we consider 0 as a missing value or impute them?
#Ans. No. for some variables,0 might be an actual value so we shift it if u are taking the logarithmic transformation



# How can we correct this?
summary(log(cars$MPG+1))
cor(log(cars$Weight), log(cars$MPG+1)) #now NAN issue is solved


cor(cars$Weight[cars$MPG!=0], cars$MPG[cars$MPG!=0]) #subletting the dataframe to remove 0 values
cor(log(cars$Weight[cars$MPG!=0]), log(cars$MPG[cars$MPG!=0])) #corr increased from last line


# Study the association between MPG and Horsepower.



#Correlation gets affected by extreme values
x <- c(1,2,3,4,5)
y <- c(11,12,15,17,20)

cor(x,y)
plot(x,y,pch =20)


x <- c(1,2,3,4,5)
y <- c(20,12,15,17,20)

cor(x,y) #Corr reduced from previous 
plot(x,y,pch =20)

x <- c(1,2,3,4,5)
y <- c(40,12,15,17,20)

cor(x,y) #Corr further reduced from previous #and is now negative
plot(x,y,pch =20)


#=======================================================================================================
#5. The ifelse() function
#=======================================================================================================

# PROBLEM 1:
# Create a variable HP which will take only two values:
# IF Horsepower < 100 THEN "Low HP"
# IF Horsepower >= 100 THEN "High HP"


cars$HP =ifelse(cars$Horsepower < 100, "Low HP", "High HP")
View(cars)






#PROBLEM 2:
# Create a Variable MPG_Rate which will take on the values as follows:
# IF MPG < 15 THEN "Normal"
# IF MPG >= 15 AND MPG <=25 THEN "GOOD"
# IF MPG >= 25 AND MPG <=35 THEN "GREAT"
# IF MPG >= 35 THEN "AWESOME"

cars$MPG_Rate =ifelse(cars$MPG < 15, "Normal",
                      ifelse(cars$MPG <= 25, "Good", ifelse( cars$MPG <= 35, "GREAT", "AWESOME")))
View(cars)





#=======================================================================================================
#6. SQL in R
#=======================================================================================================

installed.packages('sqldf')
require(sqldf)

sqldf('SELECT * from mtcars')
sqldf('select mpg from mtcars')
sqldf('select mpg, wt from mtcars')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select mpg, wt from mtcars order by mpg')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg) as avg_mpg from mtcars group by am')
sqldf('select am, avg(mpg), stdev(mpg) from mtcars group by am')






