A= data.frame(iris)
A[4,1]=NA
A[7,1]=NA
A[5,2]=NA
A[6,2]=NA
A[7,3]=NA
A[8,3]=NA
A[1:10,]
library(psych)
pairs.panels(A)
#predicting petal length
trd= A[is.na(A$Petal.Length)==FALSE,]
tsd = A[is.na(A$Petal.Length==TRUE),]
m1= lm(Petal.Length~ Petal.Width, trd)
pred1 = predict(m1, tsd)
pred1
A[is.na(A$Petal.Length)==TRUE,3]= pred1
str(A)
# PREDICTING SEPAL LENGTH
trd1 = A[is.na(A$Sepal.Length)==FALSE,]
tsd1= A[is.na(A$Sepal.Length)== TRUE,]
m2= lm(Sepal.Length~Petal.Length, trd1)
pred2= predict(m2,tsd1);pred2
A[is.na(A$Sepal.Length)==TRUE,1]= pred2

# predicting sepal width
trd2= A[is.na(A$Sepal.Width)== FALSE,]
tsd2= A[is.na(A$Sepal.Width)== TRUE,]
m3= lm(Sepal.Width~Sepal.Length, data = trd2)
pred3= predict(m3,tsd2); pred3
A[is.na(A$Sepal.Width)== TRUE,2]= pred3

#USING KNN
library(VIM)
library(class)
modelknn= kNN(A, k=5);modelknn
modelf= subset(modelknn,select = Sepal.Length:Species)
modelf[1:10,]

# IT IS FOUND THAT KNN GIVES BETTER RESULTS WRT ORIGINAL DATASET THAN LINEAR REGRESSION