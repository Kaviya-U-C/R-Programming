#========================================================================
#R - ASSIGNMENT 1
#=========================================================================

#Submitted by - Kaviya U C - D20018

#===========================================================================
# Feature Imporatnce using T tests and Chi sq tests
#=============================================================================

setwd('C:/Users/KAVIYA/OneDrive/Desktop/Term 2/I2R')
fram <- read.csv("framingham.csv")

View(fram)
str(fram)

#Converting categorical variables to factor

fram$male = as.factor(fram$male)
fram$education = as.factor(fram$education)
fram$currentSmoker= as.factor(fram$currentSmoker)
fram$BPMeds=as.factor(fram$BPMeds)
fram$prevalentStroke=as.factor(fram$prevalentStroke)
fram$prevalentHyp = as.factor(fram$prevalentHyp)
fram$diabetes = as.factor(fram$diabetes)
#Target variable - Risk of Coronary heart disease in 10 years
fram$TenYearCHD = as.factor(fram$TenYearCHD)

str(fram)

#===================================================================
# T- test for numerical variables
#====================================================================

?t.test()

#Function for T - test

t_test = function(data,var=names(data),target)
{
  #Check if target variable is a factor
  if(!is.factor(data[,target]))
  {
    stop("Enter a categorical variable as target")
  }
  p_value=c()#Initialize a vector
  signifcant = c()
  
  for(i in var)
  {
    if(is.numeric(data[,i]) || (is.integer(data[,i])))
    {
      t= t.test(data[,i] ~ data[,target])
      p_value[i]= t$p.value
     
    }
    
  }
  t_result= as.data.frame(p_value)
  View(t_result)
}

#Function call

t_test(fram,var=c("age","cigsPerDay","totChol","sysBP","diaBP","BMI","heartRate","glucose"),"TenYearCHD")

#===========================================================================
#Chi - squared test for categorical variables
#=====================================================================

?chisq.test()


chisq_test = function(data,var=names(data),target)
{
  if(!is.factor(data[,target]))
  {
    stop("Enter a categorical variable as target")
  }
  p_value=c()#Initialize a vector
  for(i in var)
  {
    if(is.factor(data[,i]))
    {
      chi=chisq.test(data[,i], data[,target],simulate.p.value=TRUE)
      p_value[i]= chi$p.value
    }
  }
  chi_result = as.data.frame(p_value)
  View(chi_result)
}

#Function call
chisq_test(fram,var=c("male","education","currentSmoker","BPMeds","prevalentStroke","prevalentHyp","diabetes"),"TenYearCHD")
