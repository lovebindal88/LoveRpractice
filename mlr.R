#NEW MLR 
#Plot scatter plot and check if variables are related to each other in linear way or not
library(ISLR)
library(MASS)
A= read.csv(file.choose())
str(A)
library(psych)
sf= sample(2,nrow(A), replace = TRUE, prob= c(0.7,0.3))
trd= A[sf==1,]
tsd= A[sf==2,]
pairs.panels(A)
model1 = lm(lc~., A)
summary(model1)
model2= lm(lc~ Vehicle+fm+lh, A)
summary(model2)
model3 = lm(lc~lh, A)
summary(model3)
model4= lm(lc~lh, trd)
pred= predict(model4, tsd)
cbind(pred, tsd$lc)
#FINAL CODE
#full making full model
MODELF= lm(lc~.,A)
#USING ANOVA(analysis of variance)
anova(MODELF,model3)
#check p value at the end for significance
#1-p value is confidence level and cannot be less than 95%