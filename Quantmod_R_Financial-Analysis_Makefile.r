#The following presents a simple walkthrough analysis and visualization of time series financial data on IBM stock performance using the 'quantmod' package in R to interface with the Yahoo Finance API.

##The required packages for the workflow include 'quantmod' and 'tidyverse'. Necessary dependencies 'xts', 'TTR', and 'zoo' will load along with these libraries.

###Note that possible conflicts with preloaded packages may result.


library(tidyverse)
library(quantmod)


##The IBM NYSE ticker ('IBM') can be identified with a simple search on the home page for Yahoo Finance. 

##The quantmod function to retrieve the price data is 'getSymbols()'.


getSymbols("IBM")


##A first look at the retrieved dataframe consisting of 2641 rows (the number of trading days since IBM's IPO) and 6 variables (open price, high price, low price, close price, volume, and adjusted) is produced with the function 'glimpse()'. Tabular data on the first 6 rows is presented with the head() function. 

###'Volume' corresponds to the number of transactions. The discrepancy between 'Adjusted' and 'Close' reflects any share splits or rights issues.


glimpse(IBM)
head(IBM)


##A line chart visualization of quantmod is produced with the function 'chart_Series()'.


chart_Series(IBM)


##A candlestick chart can be produced by default when year-to-date data is requested.

chart_Series(IBM['2017::'], name = "YTD Price Movement of IBM")


##Identifying the highest recorded price of a time series is made possible with the function 'seriesHi()'.


seriesHi(IBM)


##The calendar year market rate of return is produced with the function 'yearlyReturn()'.

yearlyReturn(IBM)


##Histograms displaying the distribution of daily returns can be produced by passing the object returned by the 'quantmod' function 'dailyReturn()' to functions of the 'ggplot' package.


IBM_daily <- dailyReturn(IBM)
ggplot(IBM_daily) + geom_histogram(aes(x = daily.returns), binwidth = .001)



#The 'quantmod' function thus simplies interfacing to finance APIs and makes preliminary analyses and visualizations of time series data easy!