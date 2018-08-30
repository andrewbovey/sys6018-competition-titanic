#========================================================#
# SYS 6018
# Kaggle Titanic Submission
#========================================================#

# Referenced https://www.datacamp.com/community/open-courses/kaggle-r-tutorial-on-machine-learning for this submission #

library(rpart)

setwd("~/Documents/GitHub/sys6018-competition-titanic")

list.files()

test <- read.csv("test.csv")
train <- read.csv("train.csv")


tree <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data = train, method = "class")

prediction <- predict(tree, newdata = test, type = "class")

solution <- data.frame(PassengerId = test$PassengerId , Survived = prediction)

write.csv(solution, file = "my_solution.csv", row.names = FALSE)