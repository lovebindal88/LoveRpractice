# new clustering 
A = read.csv(file.choose())
str(A)
B= A[,-2]
str(B)
library(psych)
library(caret)
library(class)
library(mltools)
library(data.table)
pairs.panels(B,cex=1.5)
plot(B$Fuel_Cost ~ B$Sales, text = B$utility_name)
with(A,text(Fuel_Cost~Sales, labels= A$utility_name))

