#Random forest tutorial for Henn Lab meeting on Feb. 24 2022

#Load packages
library(randomForest)
library(ISLR2)

#We will be using the Boston housing dataset - let's take a look
help(Boston)
head(Boston)
str(Boston)

#For comparison, we'll run a few linear regressions 
Boston_linear <- lm()

#Build a quick decision tree
Boston_tree <- tree()

#Add bagging and random forest
Boston_RF <- randomForest()

#Did random forest or linear regression provide better fit?

#Try a different number of variables at each split
##Side-note: the package randomforestSRC has a good function for tuning mtry and nodesize, and other nice features


#How are the most important variables related to house value (medv)?


#Introduce training and testing datasets (if time)
#Split data into training and testing data
NumPoints = nrow(Boston)
Training = NumPoints * 0.7
TrainingInt = round(Training)
TrainingPoints = sample(1:NumPoints, TrainingInt, replace = FALSE)
Boston.train = 
Boston.test = 

#Train RF on the training data
Boston_RF_train <- randomForest()

#Test the trained model on the testing data
Boston_test_predictions <- predict()



