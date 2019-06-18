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
#using hclust with complete
modelh= hclust(dist(scaledata), method = "complete") 
plot(modelh, labels= A$utility_name, hang = -1)
# using hclust with average
modelha= hclust(dist(scaledata), method = "average")
plot(modelha, labels= A$utility_name, hang = -1)
# using cutree function
modelhcut= cutree(modelh,3)
modelhacut= cutree(modelha, 3)
c= table(modelhcut,modelhacut)
confusionMatrix(c)
# using aggregate
aggregate(scaledata,list(modelhcut),mean)
# note that higher variation shows more significance in cluster

#plotting scree plot
k.max=20
wss= sapply(2:k.max, function(k)(kmeans(scaledata,k,nstart = 50,iter.max = 15)$tot.withinss))
wss
plot(2:k.max, wss, type = "b", xlab= "no. of clusters", ylab= "wss")
