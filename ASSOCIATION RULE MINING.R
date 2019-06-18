library(arules)
library(arulesViz)
data("Groceries")
inspect(Groceries)
model= apriori(Groceries, parameter = list(support= 0.001, conf= 0.8)); model
inspect(model[1:10])
plot(model)
#sorting model values by life 
model2= arules::sort(model, by="lift")
inspect(model2[1:10])
# sorting model by confidence
model3= arules:: sort(model, by="conf")
inspect(model3[1:10])
#checking redundancy(repetetion of rules in model)
chre= is.redundant(model);chre
summary(chre)
#omitting redundant rules from main model
modelred= model[!chre]; modelred
check= subset(modelred,items %in% "curd");check
inspect(check)
# sorting to check selected items
modelredcheck= apriori(Groceries,parameter = list(support=0.001, conf= 0.08), appearance = list(default="rhs",lhs= "bottled beer"))
inspect(modelredcheck)
#plotting for interactive graph
plot(modelredcheck,method = "graph", interactive = TRUE)
