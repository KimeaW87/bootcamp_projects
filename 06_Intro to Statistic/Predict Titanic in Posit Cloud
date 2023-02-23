> # Predict Survived
> #install.packages(c("titanic","dplyr","tidyverse"))
> library(titanic)
> library(dplyr)
> library(tidyverse)
── Attaching packages ─────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.2 ──
✔ ggplot2 3.4.1     ✔ purrr   1.0.1
✔ tibble  3.1.8     ✔ stringr 1.5.0
✔ tidyr   1.3.0     ✔ forcats 1.0.0
✔ readr   2.1.4     
── Conflicts ────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
> 
> #head(titanic_train)
> glimpse(titanic_train)
Rows: 891
Columns: 12
$ PassengerId <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,…
$ Survived    <int> 0, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0…
$ Pclass      <int> 3, 1, 3, 1, 3, 3, 1, 3, 3, 2, 3, 1, 3, 3, 3, 2, 3, 2, 3, 3, 2, 2, 3, 1, 3, 3, 3, 1, 3, 3, 1, 1, 3, 2, 1, 1…
$ Name        <chr> "Braund, Mr. Owen Harris", "Cumings, Mrs. John Bradley (Florence Briggs Thayer)", "Heikkinen, Miss. Laina"…
$ Sex         <chr> "male", "female", "female", "female", "male", "male", "male", "male", "female", "female", "female", "femal…
$ Age         <dbl> 22, 38, 26, 35, 35, NA, 54, 2, 27, 14, 4, 58, 20, 39, 14, 55, 2, NA, 31, NA, 35, 34, 15, 28, 8, 38, NA, 19…
$ SibSp       <int> 1, 1, 0, 1, 0, 0, 0, 3, 0, 1, 1, 0, 0, 1, 0, 0, 4, 0, 1, 0, 0, 0, 0, 0, 3, 1, 0, 3, 0, 0, 0, 1, 0, 0, 1, 1…
$ Parch       <int> 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 1, 0, 0, 5, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0…
$ Ticket      <chr> "A/5 21171", "PC 17599", "STON/O2. 3101282", "113803", "373450", "330877", "17463", "349909", "347742", "2…
$ Fare        <dbl> 7.2500, 71.2833, 7.9250, 53.1000, 8.0500, 8.4583, 51.8625, 21.0750, 11.1333, 30.0708, 16.7000, 26.5500, 8.…
$ Cabin       <chr> "", "C85", "", "C123", "", "", "E46", "", "", "", "G6", "C103", "", "", "", "", "", "", "", "", "", "D56",…
$ Embarked    <chr> "S", "C", "S", "S", "S", "Q", "S", "S", "S", "C", "S", "S", "S", "S", "S", "S", "Q", "S", "S", "C", "S", "…
> 
> #Cleansing DATA
> titanic_train_cl <- na.omit(titanic_train)
> titanic_train_cl$Sex <- factor(titanic_train_cl$Sex, 
+                                levels = c("male","female"), labels = c(-1,1), ordered = T)
> glimpse(titanic_train_cl)
Rows: 714
Columns: 12
$ PassengerId <int> 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 21, 22, 23, 24, 25, 26, 28, 31, 34, 35, 36, 38…
$ Survived    <int> 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0…
$ Pclass      <int> 3, 1, 3, 1, 3, 1, 3, 3, 2, 3, 1, 3, 3, 3, 2, 3, 3, 2, 2, 3, 1, 3, 3, 1, 1, 2, 1, 1, 3, 3, 3, 3, 2, 2, 3, 3…
$ Name        <chr> "Braund, Mr. Owen Harris", "Cumings, Mrs. John Bradley (Florence Briggs Thayer)", "Heikkinen, Miss. Laina"…
$ Sex         <ord> -1, 1, 1, 1, -1, -1, -1, 1, 1, 1, 1, -1, -1, 1, 1, -1, 1, -1, -1, 1, -1, 1, 1, -1, -1, -1, -1, -1, -1, 1, …
$ Age         <dbl> 22, 38, 26, 35, 35, 54, 2, 27, 14, 4, 58, 20, 39, 14, 55, 2, 31, 35, 34, 15, 28, 8, 38, 19, 40, 66, 28, 42…
$ SibSp       <int> 1, 1, 0, 1, 0, 0, 3, 0, 1, 1, 0, 0, 1, 0, 0, 4, 1, 0, 0, 0, 0, 3, 1, 3, 0, 0, 1, 1, 0, 2, 1, 1, 1, 1, 0, 1…
$ Parch       <int> 0, 0, 0, 0, 0, 0, 1, 2, 0, 1, 0, 0, 5, 0, 0, 1, 0, 0, 0, 0, 0, 1, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0…
$ Ticket      <chr> "A/5 21171", "PC 17599", "STON/O2. 3101282", "113803", "373450", "17463", "349909", "347742", "237736", "P…
$ Fare        <dbl> 7.2500, 71.2833, 7.9250, 53.1000, 8.0500, 51.8625, 21.0750, 11.1333, 30.0708, 16.7000, 26.5500, 8.0500, 31…
$ Cabin       <chr> "", "C85", "", "C123", "", "E46", "", "", "", "G6", "C103", "", "", "", "", "", "", "", "D56", "", "A6", "…
$ Embarked    <chr> "S", "C", "S", "S", "S", "S", "S", "S", "C", "S", "S", "S", "S", "S", "S", "Q", "S", "S", "S", "Q", "S", "…
> 
> ## Split Data
> set.seed(80)
> n <- nrow(titanic_train_cl)
> id <- sample(1:n, size=n*0.7) ## 70% train 30% test
> train_data <- titanic_train_cl[id,]
> test_data <- titanic_train_cl[-id,]
> #> nrow(train_data)#[1] 499
> #> nrow(test_data)#[1] 215
> #> 
> 
> 
> ## Train Model
> model <- glm(Survived ~ Pclass + Age + Sex, data = train_data, family = "binomial") # Pclass +  + Sex + Fare
> model

Call:  glm(formula = Survived ~ Pclass + Age + Sex, family = "binomial", 
    data = train_data)

Coefficients:
(Intercept)       Pclass          Age        Sex.L  
    3.58916     -1.23671     -0.03754      1.80864  

Degrees of Freedom: 498 Total (i.e. Null);  495 Residual
Null Deviance:	    664.1 
Residual Deviance: 443.2 	AIC: 451.2
> summary(model)

Call:
glm(formula = Survived ~ Pclass + Age + Sex, family = "binomial", 
    data = train_data)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2.6775  -0.6525  -0.3994   0.6365   2.4892  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)    
(Intercept)  3.589160   0.565131   6.351 2.14e-10 ***
Pclass      -1.236707   0.169680  -7.288 3.14e-13 ***
Age         -0.037545   0.009052  -4.148 3.36e-05 ***
Sex.L        1.808635   0.174325  10.375  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 664.07  on 498  degrees of freedom
Residual deviance: 443.20  on 495  degrees of freedom
AIC: 451.2

Number of Fisher Scoring iterations: 5

> 
> ## Test Model
> train_data$prob_survived <- predict(model,type = "response")
> train_data$pred_survived <- ifelse(train_data$prob_survived >= 0.5,1,0)
> 
> ## Confusion matrix of Train Model
> confM_titanic <- table(train_data$pred_survived,train_data$Survived,
+                       dnn = c("Predicted","Actual"))
> 
> # Accuracy
> accuracy <- (confM_titanic[1,1] + confM_titanic[2,2])/sum(confM_titanic)
> precision <- confM_titanic[2,2] / (confM_titanic[2,1]+confM_titanic[2,2])
> recall <- confM_titanic[2,2] / (confM_titanic[1,2]+confM_titanic[2,2])
> f1_score <- 2*((precision*recall)/(precision+recall))
> 
> cat("Accuracy:", accuracy, "\nPrecision:", precision, "\nRecall:", recall,"\nF1:", f1_score)
Accuracy: 0.8036072 
Precision: 0.7597765 
Recall: 0.7120419 
F1: 0.7351351
