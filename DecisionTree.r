# Import libraries
library(rpart) # Create decision tree
library(rpart.plot) # Visualize decision tree
library(caTools) # Split to testing and training

# Import and view dataset
test <-read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")
View(test)

# Handling missing values 
test$Contacted[is.na(test$Contacted)] <- "N"
test$Contacted<-as.factor(test$Contacted)

# Split the dataset in training and testing sets
split<-sample.split(test,SplitRatio = 0.7)
training_set<-subset(test,split = TRUE)
testing_set<-subset(test,split = FALSE)

# Building a decision tree and summary
tree<-rpart(Contacted~.,training_set,method = "class")
summary(tree)

# Visualize the tree
rpart.plot(tree)



