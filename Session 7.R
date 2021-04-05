## LOOPS:

#A. FOR loops:

#1.

for (i in 1:5) #Note i is an element in the vector
{
  print("Welcome to loops concept")
}

#2. Using length(x) 

x= c(3,5,2,7,8)
for(i in 1:length(x))#i takes the value 1:5
{
  print(x[i])#Since i is 1:5, then we use indexing
}

#3. Directly accessing elements of vector

for (i in x)#i takes value of x
{
  print(i)#Since i directly access elements, no need of indexing
}

#NOTE: Both approach 2 & 3, gives same results, see 

#======================================================================
# PASTE FUNCTION - paste()
#======================================================================

#Note: paste() is similar to concat

#A.

paste('Happy','Kaviya') #Notice there is no space

#B.Use of seperator:

a='Hello'
b='Teacher'

paste(a,b,sep="")
paste(a,b,sep="-")


#C. For loops with paste():


for (i in c("Sama","Ram","Ravi"))
{
  print(paste("Happy Birthday",i))
}

#===================================================================




install.packages("MASS")
library(MASS)

data(Boston)
View(Boston)#All features are numberical

nrow(Boston)
ncol(Boston)
names(Boston)#names of the columns in dataset

Boston[,1] #First column
mean(Boston[,1])

#A.Write a program to find the mean of each column

for (i in 1:ncol(Boston))
{
  print(mean(Boston[,i]))
}

#B. Which mean is for which column - format the o/p above

for (i in 1:ncol(Boston))
{
  print(paste(names(Boston)[i],":",mean(Boston[,i])))
}

for (i in 1:ncol(Boston))
{
  print(paste(names(Boston)[i],":",round(mean(Boston[,i]),3)))
}


#C. Problem with the above o/p of B - all variables are in string - How to extract and convert them?

#Lets create a blank vector now

avg = numeric() #vector of numeric datatype

for (i in 1:ncol(Boston))
{
avg[i]=mean(Boston[,i])
}

#Note: as i increases in loop, length of vector a increases - feature in R
#No need of append()

avg #Here though we have index, there is no name of col for each mean


avg[3] #single vector as one dimensional

names(avg) #Returns NA because it is doesn't have name


#Approach 1:
avg= numeric()

for(i in ncol(Boston))
{
  avg[i]=mean(Boston[,i])
}

avg

names(avg)  = names(Boston) #Assign names to mean of each column
avg

#Approach 2:
avg = c()

for(i in names(Boston)) #Using names of columns directly in the for loop
{
  avg[i]=mean(Boston[,i])
}

avg

#Approach 3:

#Matrix approach

as.matrix(avg) #This method will be useful when you compute multiple descriptive stats
View(as.matrix(avg))

matrix_avg = as.matrix(avg)
colnames(matrix_avg) = Mean  #assigning name to this col of matrix
View(matrix_avg)
dim(matrix_avg)
rownames(matrix_avg)

matrix_avg["age", ]#Subsetting - comma is complusory
#Since in this matrix age is row name


#===================================================================
#PLOTS
#=================================================================

hist(Boston[,9])


hist(Boston[,9],main=paste("Histogram of",names(Boston)[9]),
     xlab=names(Boston)[9],
     col='skyblue2')

for(i in 1:ncol(Boston))
{
  hist(Boston[,i])     
}

for (i in 1:ncol(Boston))
{
       hist(Boston[,i],
            main=paste("Histogram of",names(Boston)[i]),
            xlab=names(Boston)[i],
            ylab="No. of Houses",
            col="Orange")     
}


#====================================================================
#PARTITION AXES IN PLOTS
#==================================================================


par(mfrow=c(2,1)) #To permantely change the plot region to show 2 rows in 1 column
#2 graphs in 1 colums # Like subaxes in python


par(mfrow=c(2,1))
for(i in 1:ncol(Boston))
{
  boxplot(Boston[,i],
       main=paste("Boxplot of",names(Boston)[i]),
       #xlab=names(Boston)[i],
       #ylab="No. of Houses",
       col="maroon",
       border="grey5",
       horizontal=T)
  
  hist(Boston[,i],
       main="",
       xlab=names(Boston)[i],
       ylab="No. of Houses",
       col="Orange")
}  

#Note: To return back to subaxes run: par(mfrow=c(1,1))


#==============================================================================
#EXPORTING THE PLOTS
#===============================================================================
par(mfrow=c(1,1)) #Return subaxes to original canvas

#png() to export the plots to desired locations

#Note: In R, First define file path using png and then create graph
par(mfrow=c(2,1))
for(i in 1:ncol(Boston))
{
  png(paste(names(Boston)[i],".png",sep=" "))#Note this step
  boxplot(Boston[,i],
          main=paste("Boxplot of",names(Boston)[i]),
          #xlab=names(Boston)[i],
          #ylab="No. of Houses",
          col="maroon",
          border="grey5",
          horizontal=T)
  
  hist(Boston[,i],
       main="",
       xlab=names(Boston)[i],
       ylab="No. of Houses",
       col="Orange")
  
  dev.off() #Note this step
}  

#======================================================================
#USER DEFINED FUNCTION
#======================================================================

#1.Function def in R

Bill = function(bill) #define fn and equate it to a variable
{
  total = bill + bill*0.2
  return(total)
}

Bill(500)

Bill(c(100,101))


#2.

Bill = function(bill,tax=10) #Default args
{
  total = bill + bill*tax/100
  return(total)
}

Bill(100,20)
Bill(200) #will use the default args in this case

#3.

par(mfrow=c(2,1))
graphs = function(data)
{
  for(i in 1:ncol(data))
  {
    hist(data[,i],
         main=paste("Histogram of",names(data)[i]),
         xlab=names(data)[i])
  }
  
}

graphs(mtcars)

#4.


plotgraph = function(data)
{
  for(i in 1:ncol(data))
  {
    png(paste(names(data)[i],".png",sep=" "))#Note this step
    par(mfrow=c(2,1))
    boxplot(data[,i],
            main=paste("Boxplot of",names(data)[i]),
            #xlab=names(Boston)[i],
            #ylab="No. of Houses",
            col="maroon",
            border="grey5",
            horizontal=T)
    
    hist(data[,i],
         main="",
         xlab=names(data)[i],
         ylab="No. of Houses",
         col="Orange")
    
    dev.off() #Note this step
  }  
}

plotgraph(Boston)
getwd()
par(mfrow=c(1,1))

#================================================================
#CONDITIONAL STMTS
#==============================================================

{
  if(a==5)
  {
    print("Great")
  }
}

#1.

Bill <- function(bill,tax)
{
  if(!is.numeric(bill))
  {
    stop("The value entered must be numeric")
  }
  total = bill+bill*tax/100
  return(total)
}

Bill("Hi")
Bill(1000,20)


#Sourcing the function -- Google it or see sir's video


#=================================================================

#Assignment 1 - Do the python end term assignment in R
#Assignment 2 - 

#A. split numerical and categorical variable
#B. T test - numerical feature vs target variable - find p value - 
#O/P as table with 3 columns -(num var, p value, significant or not)

#C. Chi sq test - numerical vs categorical - find p value
##O/P as table with 3 columns -(cat var, p value, significant or not)




