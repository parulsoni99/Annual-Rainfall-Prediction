# Annual Rainfall Prediction using Linear Regression between Rainfall and temperature parameters

# Read data from excel sheets 
install packages("xlsx")
a <- read.xlsx("Rainfall.xlsx",sheetIndex=1)
b <- read.xlsx("Temperature.xlsx",sheetIndex=1)

#Find out correlation and covariance between a and b to check the strength of relationship between two variables
cor(a,b)
cov(a,b)

#Find out linear regression between a and b and create a linear model
mod <- lm(a~b)
summary(mod)

# find intercept and slope
mod$coefficients

#get the regression line plot
abline(mod)
plot(mod)

# for predicting values, give any value of temperature as input say 23
df<- data.frame(b=23)
result<- predict(mod, df)


