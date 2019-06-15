str(A)
sf= sample(2,nrow(A),replace = TRUE, prob= c(0.7,0.3))
trd= A[sf==1,]
tsd= A[sf==2,]
set.seed(1234)
#--------randomforest--------
modelrf= randomForest(admit~.,data=trd)
pred= predict(modelrf, tsd)
confusionMatrix(pred, tsd$admit, positive = "1")
#--------class imbalance with overfit--------
library(ROSE)
over= ovun.sample(admit~.,data=trd,method= "over", N= 382)$data
#n=382 is taken from 0 readings being 191*2 in trd
table(over$admit)
modelover= randomForest(admit~.,data= over)
predov= predict(modelunder,tsd)
confusionMatrix(predov,tsd$admit, positive = "1")

#----------class imbalance with underfit-----
under= ovun.sample(admit~.,data= trd, method = "under", N= 186)$data
#n= 182 is taken 93*2 for 1 occurance in tsd
modelun= randomForest(admit~.,data= under)
predun= predict(modelun,tsd)
confusionMatrix(predun, tsd$admit, positive= "1")
table(under$admit)

#----class imbalance with both-----
both <- ovun.sample(admit~.,data= trd, method= "both", p= 0.5, seed = 1234, N=284)$data
table(both$admit)
modelboth= randomForest(admit~.,data= both)
predboth= predict(modelboth,tsd)
confusionMatrix(predboth, tsd$admit, positive = "1")

#---------class imbalance with ROSE----------
rose = ROSE(admit~., data= trd, N= 500, seed = 1234)$data
table(rose$admit)
modelrose= randomForest(admit~.,data= rose)
predrose= predict(modelrose, tsd)
confusionMatrix(predrose,tsd$admit, positive = "1")

