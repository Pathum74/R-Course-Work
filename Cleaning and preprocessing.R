library(dplyr) # Data manipulation 
library(ggplot2) # Data visualization
library(caret) # predictive modeling and Machine learning  
library(lattice) # Data visualization

# Import and view data set
data <-read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")
View(data)


# structure and overview
head(data)
str(data)
summary(data)


# Remove unnecessary column (Use dplyr)
data <-data %>% select(-City_Category,-City_Code,-Lead_Creation_Date,-Var1)
View(data)


# Handling missing values
# Identify missing values by column
colSums(is.na(data))

# Remove or input missing value
# Input mean value
data$Loan_Amount[is.na(data$Loan_Amount)] <-mean(data$Loan_Amount,na.rm=TRUE)
# Remove missing values
data <-na.omit(data)


# Check for duplicates
duplicate_rows <-duplicated(data)
sum(duplicate_rows)

# Remove duplicate data
data <-data[!duplicate_rows(data), ]



# Calculate interquartile range
Q1 <- quantile(data$Monthly_Income, 0.25)
Q3 <- quantile(data$Monthly_Income, 0.75)
IQR <- Q3-Q1
data <-data[data$Monthly_Income >(Q1-1.5*IQR) & data$Monthly_Income <(Q3+1.5*IQR),]

# Remove outliers based on z-scores
Zscores <-scale(data$Monthly_Income)
data <-data[abs(Zscores)<3, ]

boxplot(data$Monthly_Income)



# Standardize the data
Preprocess_prams <-preProcess(data,method = c("center","scale"))
data_standardized <-predict(Preprocess_prams, newdata=data)

# Give Standardize data
print(data_standardized)

# Normalize numeric columns
# Scale without centering
data$Monthly_Income <-scale(data$Monthly_Income, center=FALSE)

# Convert column to factor
data$Loan_Amount <-factor(data$Loan_Amount)
# Print the converted column
print(data)


# Convert character column to numeric and a new factor
data <-data %>%
  mutate_if(is.character,as.factor)%>%
  mutate(across(where(is.factor),as.numeric))%>%
  mutate(NewFeature=Loan_Amount+Monthly_Income)

# result
print(data)

# Write clean data to csv file
write.csv(data,"test.csv",row.names = FALSE)




















