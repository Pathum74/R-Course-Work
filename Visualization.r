# 2.1 Histogram
dataset <-read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")

hist(dataset$Monthly_Income,
     main = "Histrogram of Monthly Income",
     xlab = "Monthly Income",
     col = "lightblue",
     border = "black")


# 2.2 Boxplot
dataset <-read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")

# Boxplot of monthly income by City Category
boxplot(Monthly_Income ~ City_Category, 
        data = dataset,
        main = "Monthly Income by City Category",
        xlab = "City Categroy",
        ylab = "Mothly Income",
        col  = c("lightgreen","skyblue","salmon"))


# 2.3 Pie Chart
dataset <-read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")

# Pie chart for City Category
city_category_count <- table(dataset$City_Category)
pie(city_category_count,
    main = "City Category Propotion",
    col = rainbow(length(city_category_count)))


# 2.4 Scatter Plot
dataset <-read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")

# Calculate age from DOB if needed
dataset$Age <- as.numeric(format(Sys.Date(),"%Y")) - as.numeric(format(as.Date(dataset$DOB, "%d%m%Y"), "%Y"))

# Scatter plot of Age vs. Monthly Income
plot(dataset$Age, dataset$Monthly_Income,
     main= "Scatter Plot of Age vs Monthly Income",
     xlab= "Age",
     ylab= "Monthly Income",
     col= "blue",
     pch= 19)
