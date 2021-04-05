#========================================================================
#R - ASSIGNMENT 2
#=========================================================================

#Submitted by - Kaviya U C - D20018

#===========================================================================
# Functions for EDA
#=============================================================================

setwd('C:/Users/KAVIYA/OneDrive/Desktop/Term 2/I2R')
attr <- read.csv("attrition.csv")

View(attr)
str(attr)


#Data Preparation - Converting the categorical features to factor datatype

attr$Attrition = as.factor(attr$Attrition)
attr$BusinessTravel = as.factor(attr$BusinessTravel)
attr$EnvironmentSatisfaction= as.factor(attr$EnvironmentSatisfaction)
attr$JobLevel=as.factor(attr$JobLevel)
attr$JobSatisfaction=as.factor(attr$JobSatisfaction)
attr$JobInvolvement=as.factor(attr$JobInvolvement)
attr$WorkLifeBalance=as.factor(attr$WorkLifeBalance)

str(attr)

#===================================================================
#Histogram for numerical features
#===================================================================

dist=function(df)
{
  if(!is.data.frame(df))
  {
    stop("Alert! Pass dataframe as input")
  }
  
  for(i in 1:ncol(df))
  { #Check for numerical features
    if(is.numeric(df[,i]) || (is.integer(df[,i])))
    {
      #2 graphs in one frame 
      par(mfrow=c(1,1))
      #Export the graphs as png images
      png(paste(names(df)[i],".png",sep=" "))
      
      #Histogram
      hist(df[,i],
           main=paste("Histogram of",names(df)[i]),
           xlab=names(df)[i],
           ylab="Frequency",
           col="Blue"
           )
      
      dev.off() 
    }
  }
}

#Function Call
dist(attr)


#===================================================================
#Histogram and Boxplot for numerical features
#Barplot for categorical features
#==================================================================
par(mfrow=c(2,1))

Graph_num=function(df)
{
  if(!is.data.frame(df))
  {
    stop("Alert! Pass dataframe as input")
  }
  
  for(i in 1:ncol(df))
  { #Check for numerical features
    if(is.numeric(df[,i]) || (is.integer(df[,i])))
    {
      #Export the graphs as png images
      png(paste(names(df)[i],".png",sep=" "))
      #2 graphs in one frame 
      par(mfrow=c(2,1))
      
      #Boxplot
      boxplot(df[,i],
              main=paste("Boxplot and Histogram of",names(df)[i]),
              col="maroon",
              border="grey5",
              horizontal=T)
      
      #Histogram
      hist(df[,i],
           main="",
           xlab=names(df)[i],
           ylab="Frequency",
           col="Orange")
      
      
    }
    if(is.char(df[,i]) || (is.factor(df[,i])))
    {
      png(paste(names(df)[i],".png",sep=" "))
      par(mfrow=c(1,1))
      #Barplot
      barplot(table(df[,i]),
              main=paste("Barplot of",names(df)[i]),
              xlab=names(df)[i],
              ylab="Frequency",
              col="Blue")
    }
    dev.off() 
  }
}

#Function call
Graph_num(attr)

#Resetting the axes
par(mfrow=c(1,1))



#===========================================================================
# Plot only for mentioned variables
#==========================================================================


Graph_var=function(df,var=names(df))
{
  if(!is.data.frame(df))
  {
    stop("Alert! Pass dataframe as input")
  }
  
  for(i in var)
  { #Check for numerical features
    if(is.numeric(df[,i]) || (is.integer(df[,i])))
    {
      #Export the graphs as png images
      png(paste(names(df)[i],".png",sep=" "))
      #2 graphs in one frame 
      par(mfrow=c(2,1))
      
      #Boxplot
      boxplot(df[,i],
              main=paste("Boxplot and Histogram of",names(df)[i]),
              col="maroon",
              border="grey5",
              horizontal=T)
      
      #Histogram
      hist(df[,i],
           main="",
           xlab=names(df)[i],
           ylab="Frequency",
           col="Orange")
      
      
    }
    if(is.character(df[,i]) || (is.factor(df[,i])))
    {
      png(paste(names(df)[i],".png",sep=" "))
      par(mfrow=c(1,1))
      #Barplot
      barplot(table(df[,i]),
              main=paste("Barplot of",names(df)[i]),
              xlab=names(df)[i],
              ylab="Frequency",
              col="Blue")
    }
    dev.off() 
  }
}

#Function call
Graph_var(attr,var=c(1,3,5))

#=====================================================================
#Dynamic Working Directory
#================================================================

Graph_dir=function(df,var=names(df),dir)
{
  #Current Directory
  getwd()
  #Changing Directory
  setwd(dir)
  if(!is.data.frame(df))
  {
    stop("Alert! Pass dataframe as input")
  }
  
  for(i in var)
  { #Check for numerical features
    if(is.numeric(df[,i]) || (is.integer(df[,i])))
    {
      #Export the graphs as png images
      png(paste(names(df)[i],".png",sep=" "))
      #2 graphs in one frame 
      par(mfrow=c(2,1))
      
      #Boxplot
      boxplot(df[,i],
              main=paste("Boxplot and Histogram of",names(df)[i]),
              col="maroon",
              border="grey5",
              horizontal=T)
      
      #Histogram
      hist(df[,i],
           main="",
           xlab=names(df)[i],
           ylab="Frequency",
           col="Orange")
      
      
    }
    if(is.character(df[,i]) || (is.factor(df[,i])))
    {
      png(paste(names(df)[i],".png",sep=" "))
      par(mfrow=c(1,1))
      #Barplot
      barplot(table(df[,i]),
              main=paste("Barplot of",names(df)[i]),
              xlab=names(df)[i],
              ylab="Frequency",
              col="Blue")
    }
    dev.off() 
  }
}

#Function call
Graph_dir(attr,var=c(1,3,5),dir="C:/Users/KAVIYA/OneDrive/Desktop")


