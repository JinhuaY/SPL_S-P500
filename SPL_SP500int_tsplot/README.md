
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPL_SP500int_tsplot** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet: SPL_SP500int_tsplot

Published in: has not been published

Description: Shows daily returns of 10 Internet and Software stocks in S&P500 from 2015/05/01 to 2016/04/25.

Keywords: plot, graphical representation, time-series, portfolio, financial, returns

See also: SPL_SP500int_VaR, SPL_SP500int_test

Author: Jinhua Yang, Fan Song, Yue Wang, Wei Zhang

Datafile: data_stock.csv

Example: plots of daily returns of these 10 stocks

```

![Picture1](Google.png) 
![Picture1](ebay.png) 
![Picture1](facebook.png) 
![Picture1](netflix inc..png) 
![Picture1](total system service.png)
![Picture1](verisign inc..png) 
![Picture1](wester union.png) 
![Picture1](yahoo.png) 
![Picture1](Fidelity National Information Service.png) 
![Picture1](auto data processing.png)

```r

# clear history
rm(list = ls(all = TRUE))
graphics.off()

# set working directory
#setwd("...")

# import data
stock = as.data.frame(read.csv("data_stock.csv", header = T, sep = ","))


# get daily return of each stock
price = stock[, 2:11]
value = matrix(stock[, 12], nrow = T)
T = nrow(price)
n = ncol(price)

return = log(price[2, ]/price[1, ])
for (j in 2:(T - 1)) {
    return[j, ] = log(price[j + 1, ]/price[j, ])
}


# plot the return of every stock against date
date = as.Date(stock$Date[2:248], "%Y/%m/%d")

plot(date, return$GOOGL, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Google")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$EBAY, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Ebay")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$FB, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Facebook")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$YHOO, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Yahoo")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$WU, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Wester Union")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$VRSN, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Verisign Inc.")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$NFLX, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Netflix Inc.")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$TSS, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Total System Service")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$FIS, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Fidelity National Information Services")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

plot(date, return$ADP, type = "l", ylab = "daily returns", xaxt = "n", main = "Daily Stock return of Automatic Data Processing")
axis.Date(1, at = date, labels = format(date, "%Y/%m"), las = 0)

```
