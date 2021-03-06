#Lab 6
#Date: 10th Feb 2020

rm(list = ls())

#Learning %in% operator
a <- c(1, 4, 5, 7)
b <- runif(n = 20, min = 1, max = 20)

#Round off (example)
round(c(2.34, 2.56), 0) #to round off numbers

b <- round(b, 0)

#a in b: It checks each element of a in b
a %in% b

#b in a: It checks each element of b in a
b %in% a
#(The lenght of output will be same as lenght of object on left hand side of %in%)

#working example
df <- data.frame(RollNo = 1001:1010, Marks = rnorm(10, 10, 2))

#get the data of following roll numbers:
R <- c(1003, 1005, 1009, 1001)

#solution
df[df$RollNo %in% R, ]

#example: subsetting in data frame
df[c(1,4, 6), ] #gives you 1st, 4th and 6th row
df[ , c(T, F)]  #gives fist colum
df[c(T, F, ), ] #gives alternate row

## IF (excel) vs ifelse (R)
a <- df$Marks

#If marks are less than 8, then "Fail", otherwise "Pass"
df$Status <- ifelse(a > 8, "Pass", "Fail")
df


#2. Assigning grade on following criteria
#Grade
#marks <= 8: Fail
#Marks between >8 - 12: C
# >12 - 16: B
# More than >16 : A

df$grade <- ifelse( a <= 8 , "Fail", 
                    ifelse( a <= 12, "C",
                            ifelse(a <= 16, "B", "A")))



##apply family functions
set.seed(1234)
df2 <- matrix(data = rnorm(100), ncol = 10)
head(df2, 2)

#Mean of each column and row
#sum of each column
#min of each column
#max of each row
#winsorization of each column at 5%. (Difficult and H.W.)

mean(df2[, 4])

#mean of each row
apply(df2, 1, FUN = mean)

#mean of each column: put `MARGIN = 2`
cmean <- apply(df2, 2, FUN = mean)

#which column has highest mean
which( cmean == max(cmean))


#coverting few values in NA and then doing all above part again
df2[c(2, 12, 34, 54, 65, 76, 87, 97)] <- NA
#Repeat all above part
#Further:
# Caculate number of NA values in each column

#Solution
apply(df2, 2, FUN = function(x) mean(x, na.rm = T)) #mean of each column
apply(df2, 2, FUN = function(x) max(x, na.rm = T)) #max of each column
apply(df2, 2, FUN = function(paridhi) min(paridhi, na.rm = T)) #min of each column

#getting numbers of NA in each column

#1. Method: defining function 
countNA <- function(x) {
  sum (is.na(x))
}

apply(df2, 2, FUN = countNA)

#2. Defining fuctiion within apply
apply(df2, 2, FUN = function(x) sum(is.na(x)))


#Challenge on attendace data