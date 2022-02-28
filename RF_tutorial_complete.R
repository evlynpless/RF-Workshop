#Random forest tutorial for Henn Lab meeting on Feb. 24 2022

install.packages("tree")

#Load packages
library(randomForest)
library(randomForestSRC)
library(tree)
library(ISLR2)

#We will be using the Boston housing dataset - let's take a look
help(Boston)
head(Boston)
str(Boston)
hist(Boston$medv)

#For comparison, we'll run a few linear regressions 
Boston_linear <- lm(medv ~ dis, data=Boston)
summary(Boston_linear)
Boston_linear <- lm(medv ~ dis + rm + age, data=Boston)
summary(Boston_linear)
Boston_linear <- lm(medv ~ ., data=Boston)
summary(Boston_linear)

#Build a quick decision tree
Boston_tree <- tree(medv~., data=Boston)
summary(Boston_tree)
plot(Boston_tree)
text(Boston_tree)

#Add bagging and random forest
Boston_RF <- randomForest(medv~., data=Boston)
Boston_RF
mean(Boston_RF$rsq)
varImpPlot(Boston_RF)

#Did random forest or linear regression provide better fit?

#Try a different number of variables at each split
##Side-note: the package randomForestSRC has a good function for tuning mtry and nodesize, and other nice features
Boston_RF <- randomForest(medv~., mtry=6, data=Boston)

#How are the most important variables related to house value (medv)?
plot(Boston$rm, Boston$medv)
plot(Boston$lstat, Boston$medv)

#Introduce training and testing datasets (if time)
#Split data into training and testing data
NumPoints = nrow(Boston)
Training = NumPoints * 0.7
TrainingInt = round(Training)
TrainingPoints = sample(1:NumPoints, TrainingInt, replace = FALSE)
Boston.train = Boston[TrainingPoints,]
Boston.test = Boston[-TrainingPoints,]

#Train RF on the training data
Boston_RF_train <- randomForest(medv~., data=Boston.train)
Boston_RF_train

#Test the trained model on the testing data
Boston_test_predictions <- predict(Boston_RF_train, Boston.test)
plot(Boston_test_predictions, Boston.test$medv)
abline(0,1)
mean((Boston_test_predictions-Boston.test$medv)^2)


