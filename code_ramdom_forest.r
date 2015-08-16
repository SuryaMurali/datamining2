# Assign the training set
train <- read.csv(file="train_set.csv", header=TRUE, sep=",",na.strings=c("", "NA", "NULL"))

# Assign the validation set
validation <- read.csv(file="validation_set.csv", header=TRUE, sep=",",na.strings=c("", "NA", "NULL"))

# Assign the test set
test <- read.csv(file="test_set.csv", header=TRUE, sep=",",na.strings=c("", "NA", "NULL"))

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
#install.packages("randomForest")
library(randomForest)

levels(test$supplier)<-levels(train$supplier)
levels(test$month_of_quote)<-levels(train$month_of_quote)
levels(test$annual_usage)<-levels(train$annual_usage)
levels(test$bracket_pricing)<-levels(train$bracket_pricing)
levels(test$quantity)<-levels(train$quantity)
levels(test$end_a_1x)<-levels(train$end_a_1x)
levels(test$end_a_2x)<-levels(train$end_a_2x)
levels(test$end_x_1x)<-levels(train$end_x_1x)
levels(test$end_x_2x)<-levels(train$end_x_2x)
levels(test$end_a)<-levels(train$end_a)
levels(test$end_x)<-levels(train$end_x)
levels(test$num_boss)<-levels(train$num_boss)
levels(test$num_bracket)<-levels(train$num_bracket)
levels(test$forming_end_a)<-levels(train$forming_end_a)
levels(test$forming_end_x)<-levels(train$forming_end_x)

my_tree_rpart_v<-rpart(cost~supplier+month_of_quote+annual_usage+bracket_pricing+quantity+end_a_1x+end_a_2x+end_x_1x+end_x_2x+end_a+end_x+num_boss+num_bracket+forming_end_a+forming_end_x,data=train,control=rpart.control(cp=0,minsplit=50))
#fancyRpartPlot(my_tree_rpart_v)
my_prediction_rpart_v<-predict(my_tree_rpart_v,validation)
solution_rpart_tree_v<-data.frame(tube_assembly_id=validation$tube_assembly_id,cost=my_prediction_rpart_v,cost_og=validation$cost)
#solution_rpart_tree_v$rmsle<-log(solution_rpart_tree$cost+1)-log(solution_rpart_tree$cost_og-1)
write.csv(solution_rpart_tree_v,file="solution_rpart_tree_v.csv",row.names=FALSE)

my_tree_rpart_t<-rpart(cost~supplier+month_of_quote+annual_usage+bracket_pricing+quantity+end_a_1x+end_a_2x+end_x_1x+end_x_2x+end_a+end_x+num_boss+num_bracket+forming_end_a+forming_end_x,data=train,control=rpart.control(cp=0,minsplit=50))
#fancyRpartPlot(my_tree_rpart_t)
my_prediction_rpart_t<-predict(my_tree_rpart_t,test)
solution_rpart_tree_t<-data.frame(id=test$id,cost=my_prediction_rpart_t)
#solution_rpart_tree_v$rmsle<-log(solution_rpart_tree$cost+1)-log(solution_rpart_tree$cost_og-1)
write.csv(solution_rpart_tree_t,file="solution_rpart_tree_t.csv",row.names=FALSE)

#randomforest
set.seed(17)
my_forest_1<-randomForest(cost~.,data=train,mtry=2,importance=TRUE, ntree=1000,do.trace=500)
str(train)
my_prediction_1<-predict(my_forest_1,test)
soln_my_prediction_1<-data.frame(id=test$id,cost=my_prediction_1)
write.csv(soln_my_prediction_1, file = "my_solution_1.csv", row.names = FALSE)
varImpPlot(my_forest_1)
?rfImpute
set.seed(222)
train.imputed <- rfImpute(cost ~ ., train)
set.seed(333)
rf_i <- randomForest(cost ~ ., train.imputed)
my_prediction_2<-predict(rf_i,test)
soln_my_prediction_2<-data.frame(id=test$id,cost=my_prediction_2)
write.csv(soln_my_prediction_2, file = "my_solution_2.csv", row.names = FALSE)
varImpPlot(rf_i)
