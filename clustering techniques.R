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
with(A,text(Fuel_Cost~Sales, labels= A$utility_name, pos= 4,cex= 0.7))
#use one hot encoding
B= one_hot(as.data.table(A))
scaledata= as.matrix(scale(B));scaledata
#using kmeans
m1 = kmeans(scaledata,3)
plot(B$Fuel_Cost~ B$Sales, col = m1$cluster)
#using hclust
modelh= hclust(dist(scaledata), method = "complete") 
plot(modelh, labels= A$utility_name)
