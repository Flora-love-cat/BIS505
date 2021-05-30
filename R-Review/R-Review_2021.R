######################################
## R-Review: R Basics
## BIS 505b - 2021
## Copyright (c) 2021, M. Ciarleglio
######################################


##-----------------------
## I.5: Working Directory
##-----------------------
setwd("C:\\BIS_505\\LABS\\Lab0")  # Modify path to your R Lab0 folder


##------------------------
## II.1: R as a calculator
##------------------------
2^2+6
2^(2+6)
4>2
# (7+9)*(12-3-
 

##--------------------------------------------
## II.2: Creating Objects and Assigning Values     
##--------------------------------------------
a <- 5
a
z = 3
z

a+2

b <- a*7
b
B


##------------------------------------
## II.3: Scalars, Vectors, Data Frames
##------------------------------------
hours <- 40
weeks <- 52
employee <- c("John", "Pete", "Ben", "Mary")   	# character vector
hourly <- c(12, 15, 22, 16)    	                # numeric vector
grad <- c(FALSE, TRUE, TRUE, TRUE)              # logical vector

employee[2]
employee[2] = "Peter"    # changing 2nd element of employee vector
employee

hourly[hourly>15]

hours*hourly

wages <- data.frame(employee, hourly)
wages

wages[1,]   # first row of data frame wages
wages[,1]   # first column of data frame wages

ls()
# rm(list=ls())  


##---------------------
## II.4: Missing Values
##---------------------
employeeM <- c("John", "Pete", "Ben", NA)
hourlyM <- c(12, 15, NA, 16) 
gradM <- c(FALSE, NA, TRUE, TRUE)
wagesM <- data.frame(employeeM, hourlyM, gradM)
wagesM

annualM <- hourlyM*hours*weeks
annualM


##----------------
## II.5: Functions
##----------------
annual
(24960+31200+45760+33280)/4

avgsal <- mean(annual)
avgsal

annualM
mean(annualM)
mean(annualM, na.rm=TRUE)


##----------------------
## III.1: Importing Data
##----------------------
# No path: data file in my working directory
mydata <- read.table("hgb.csv", header=TRUE, sep=",") 
# Data file not in my working directory
mydata <- read.table("C:\\BIS_505\\LABS\\Lab0\\hgb.csv", header=TRUE, sep=",")  # modify path to your R Lab0 folder

# No path: CSV file in my working directory
mydata <- read.csv("hgb.csv", header=TRUE)  
getwd()


##-----------------------------------
## III.2: Structure of the Data Frame
##-----------------------------------
str(mydata)

dim(mydata)   # dimension of data frame (number of rows, number of columns)
nrow(mydata)  # number of rows (observations) of a data frame
ncol(mydata)  # number of columns (variables) of a data frame

head(mydata, n=5)  # first 5 lines
tail(mydata, n=5)  # last 5 lines


##-------------------------------------------
## III.3: Accessing Variables in a Data Frame
##-------------------------------------------
names(mydata)
mean(age)

summary(mydata$hgb9)
summary(mydata$hgb36)


##-------------------------------
## III.5: Sorting a Data Frame
##-------------------------------
mydatasort1 <- mydata[order(mydata$age),]
head(mydatasort1)

mydatasort2 <- mydata[order(-mydata$age),]
head(mydatasort2)

mydatasort3 <- mydata[order(mydata$age, mydata$edyrs),]
head(mydatasort3)


##-------------------------------
## III.5: Subsetting a Data Frame
##-------------------------------
# Select rows
mydataFirst10rows <- mydata[1:10,]
mydataFirst10rows

# Select columns
mydataFirst2columns <- mydata[,c(1,2)]
head(mydataFirst2columns, n=3)

names(mydata)
mydatasubset <- mydata[,c("id", "group")]
head(mydatasubset, n=3)

# Option 1: subset() function, Subsetting and selecting only variables group and age
newdata <- subset(mydata, age >= 20 & age <= 25, select=c(group, age))
dim(newdata)
summary(newdata$age)

# Option 2: bracket operator
newdata2 <- mydata[mydata$age >= 20 & mydata$age <= 25,]
summary(newdata2$age)


##----------------------------------------------
## III.6: Creating New Variables in a Data Frame
##----------------------------------------------
mydata$wtgain = mydata$wt1 - mydata$wt0
names(mydata)
summary(mydata$wtgain)
mydata[1:10, c("wt0", "wt1", "wtgain")]  # print rows 1-10

mydata$age[mydata$age > 30]
mydata$age[mydata$age > 30] <- 30


##-----------------------------------
## III.7: Exporting Data Frame to CSV
##-----------------------------------
write.csv(mydata, "C:\\BIS_505\\LABS\\Lab0\\saveddata.csv", row.names = FALSE)   # modify path to your destination

write.csv(mydata, "saveddata2.csv", row.names = FALSE)                  # no path: Will default to your working directory 


##-------------------
## IV.1: Getting Help
##-------------------
?rnorm
help(rnorm)
example(rnorm)


##----------------
## IV.2: Libraries
##----------------
install.packages("ggplot2") 
library(ggplot2)

# ggplot is a function in the ggplot2 package
ggplot(mydata, aes(x=hgb9, y=hgb36, color=group)) +
  geom_point() 

