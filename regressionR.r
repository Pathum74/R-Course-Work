library(ggplot2)
library(caret)

# Get dataset
dataset <- read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")
View(dataset)
# Checking for missing values
colSums(is.na(dataset))

# Handling missing values
dataset$Loan_Amount[is.na(dataset$Loan_Amount)] <- mean(dataset$Loan_Amount, na.rm = TRUE)

# Convert strings into factors
dataset$Gender <- as.factor(dataset$Gender)
dataset$City_Category <- as.factor(dataset$City_Category)

# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(dataset$Monthly_Income, p = 0.8, list = FALSE)
trainData <- dataset[trainIndex, ]
testData <- dataset[-trainIndex, ]

# Create simple regression model
model <- lm(Monthly_Income ~ Loan_Amount + Gender + City_Category + Existing_EMI, data = trainData)

# Model summary
summary(model)

# Make predictions on the test data
testData$Predicted_Income <- predict(model, newdata = testData)
trainData$Predicted_Income<-predict(model,newdata = trainData)

# Actual vs predicted scatterplot for the test data
ggplot(testData, aes(x = Monthly_Income, y = Predicted_Income)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_abline(color = "red", slope = 1, intercept = 0, linetype = "dashed") +
  labs(title = "Actual vs Predicted Monthly Income", x = "Actual", y = "Predicted")


