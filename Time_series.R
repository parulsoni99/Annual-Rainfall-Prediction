# Annual Rainfall Prediction using Auto Regressive Integrated Moving Average Model (ARIMA) for Time Series Analysis 

install.packages("xlsx")       #package to read data from excel sheet

data <- read.xlsx("Rainfall.xlsx", sheetIndex=1)
data <- ts(data, start=1901, end=2002)       #to convert data to time series
plot(data)

# Augmented Dickey Fuller test to verify if time series is stationary.
# Null hypothesis: a unit root is present in a time series
# Alternate Hypothesis: stationary time series
adf.test(data)

# differentiate data to make it stationary
diff_data <- diff(data) 
plot(diff_data)

# find the (p, d, q ) value for the ARIMA modeling.
# The Autocorrelation and Partial Autocorrelation will provide with the values of q and p respectively.
acf(diff_data)

# apply ARIMA function
result<- arima(data, order=c(3,1,1), seasonal=c(3,1,1))

#predicted values from the year 2003 to 2027. 
predict(result, n.ahead=25)

