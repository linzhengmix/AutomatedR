
install.packages("C50")
install.packages("rpart")
library(C50)
library(rpart)
data(churn)

churnTrain = churnTrain[,!names(churnTrain) %in% c("state","area_code","account_length")]
set.seed(2)
ind = sample(2,nrow(churnTrain),replace = T,prob = c(0.7,0.3))
trainset = churnTrain[ind == 1,]
testset = churnTrain[ind == 2,]