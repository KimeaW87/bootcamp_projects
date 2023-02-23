# -*- coding: utf-8 -*-

# -- Sheet --

#Install Packages
install.packages("titanic")

install.packages("dplyr")

install.packages("tidyverse")

#Load Library
library(titanic)
library(dplyr)
library(tidyverse)

glimpse(titanic_train)

#Cleansing DATA
titanic_train_cl <- na.omit(titanic_train)

#Factor Sex Column
titanic_train_cl$Sex <- factor(titanic_train_cl$Sex, 
                               levels = c("male","female"), labels = c(-1,1), ordered = T)
glimpse(titanic_train_cl)

## Split Data
set.seed(88)
n <- nrow(titanic_train_cl)
id <- sample(1:n, size=n*0.7) ## 70% train 30% test
train_data -> titanic_train_cl[id,]
glimpse(train_data)
test_data <- titanic_train_cl[-id,]
glimpse(test_data)
#> nrow(train_data)#[1] 499
#> nrow(test_data)#[1] 215

## Train Model
model <- glm(Survived ~ Pclass + Age + Sex, data = train_data, family = "binomial") # Pclass +  + Sex + Fare
model
summary(model)

## Test Model
train_data$prob_survived <- predict(model,type = "response")
train_data$pred_survived <- ifelse(train_data$prob_survived >= 0.5,1,0)
glimpse(train_data$pred_survived)

## Confusion matrix of Train Model
confM_titanic <- table(train_data$pred_survived,train_data$Survived,
                      dnn = c("Predicted","Actual"))
confM_titanic

# Evaluate Model
accuracy <- (confM_titanic[1,1] + confM_titanic[2,2])/sum(confM_titanic)
precision <- confM_titanic[2,2] / (confM_titanic[2,1]+confM_titanic[2,2])
recall <- confM_titanic[2,2] / (confM_titanic[1,2]+confM_titanic[2,2])
f1_score <- 2*((precision*recall)/(precision+recall))

#Print Results
cat("Accuracy:", accuracy, "\nPrecision:", precision, "\nRecall:", recall,"\nF1:", f1_score)

