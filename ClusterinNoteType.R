# Load dataset
data <- read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")

# Handle missing values
data$Loan_Amount[is.na(data$Loan_Amount)] <- median(data$Loan_Amount, na.rm = TRUE)
data$Loan_Period[is.na(data$Loan_Period)] <- as.numeric(names(which.max(table(data$Loan_Period))))

# Standardize the features using the scale function
data_scaled<-scale(data[, c("Loan_Amount", "Loan_Period")])

# Perform k-means clustering with Loan_Amount and Loan_Period
result <- kmeans(data_scaled, centers = 3)


# Display cluster sizes
print(result$size)

# Visual representation of k-means clustering
plot(data[, c("Loan_Amount", "Loan_Period")], col = result$cluster,
     main = "K-Means Clustering on Loan Data",
     xlab = "Loan Amount", ylab = "Loan Period")

# Optional: Plot with Monthly_Income (ensure Monthly_Income is categorical)

plot(data[, c("Loan_Amount", "Loan_Period")], col = data$Monthly_Income,
     main = "Actual Representation by Monthly Income",
     xlab = "Loan Amount", ylab = "Loan Period")


