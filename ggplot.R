data <-read.csv("C:/Users/MSI/Documents/nsbm/Year 02 semester 01/R/courseWork/test.csv")
str(data)

library(ggplot2)

#Barplot
ggplot(data=data,aes(x=Loan_Amount,y=Monthly_Income))+
  geom_bar(stat = "identity",fill='blue')+
  labs(title = "Barplot",x="Loan amount",y="Monthly income")+
  theme_minimal()

  
#Scatter plot
ggplot(data=data,aes(x=Interest_Rate,y=Monthly_Income))+
  geom_point(color="blue")+
  labs(title="Scatterplot",x="Interest rate",y="Monthly income")+
  theme_minimal()


#Line chart
ggplot(data=data,aes(x=Loan_Period,y=Loan_Amount))+
  geom_line(color = "red") +
  labs(title = "Line chart",x="Loan period",y="Loan amount")+
  theme_minimal()


#Histogram
ggplot(data=data,aes(x=Loan_Amount))+
  geom_histogram(fill='green',color='black')+
  labs(title = "Histogram",x="Loan amount")+
  theme_minimal()


#Boxplot
ggplot(data=data,aes(x=factor(Loan_Amount),y=Monthly_Income))+
  geom_boxplot(color="purple")+
  labs(title = "Boxplot",x="Loan amount",y="Monthly income")+
  theme_minimal()


#Density curve
ggplot(data=data,aes(x=Loan_Period))+
  geom_density(fill="blue")+
  labs(title = "Density curve",x="Loan Period")+
  theme_minimal()


#Area chart
ggplot(data=data,aes(x=Loan_Amount,y=Monthly_Income))+
  geom_area(fill="green",color="black",alpha=0.5)+
  labs(title = "Area chart",x="Loan amount",y="Monthly income")+
  theme_minimal()


#Bubble chart
ggplot(data=data,aes(x=Loan_Amount,y=Monthly_Income,size = Loan_Amount))+
  geom_point(alpha=0.5,color='purple')+
  labs(title = "Bubble Chart", x = "Loan Amount", y = "Monthly Income") +
  theme_minimal()


