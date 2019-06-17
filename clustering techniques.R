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
plot(B$Fuel_Cost ~ B$Sales)
#adding labels to plot
with(A,text(Fuel_Cost~Sales, labels= A$utility_name, pos= 4,cex= 0.5))

