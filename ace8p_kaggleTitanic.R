#========================================================#
# SYS 6018
# Kaggle Titanic Submission
#========================================================#

library(rpart)

setwd("~/Documents/GitHub/sys6018-competition-titanic")

list.files()

test <- read.csv("test.csv")
train <- read.csv("train.csv")
gender_submission <- read.csv("gender_submission.csv")

train$YoungOld <- NA
train$YoungOld[train$Age < 18] <- 1
train$YoungOld[train$Age >= 18] <- 0

tree <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = "class")

prediction <- predict(tree, newdata = test, type = "class")

solution <- data.frame(PassengerId = test$PassengerId , Survived = prediction)
write.csv(solution, file = "my_solution.csv", row.names = FALSE)




