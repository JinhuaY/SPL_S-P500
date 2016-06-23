
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SPL_SP500int_test** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet: SPL_SP500int_test

Published in: has not been published

Description: 'Applies DW(Durbin Watson) test and Engle''s ARCH test to returns of 10 Internet 
and Software stocks in S&P500 (time period: 2015/05/01-2016/04/25).'

Keywords: arch, time-series, returns, test, autocorrelation

See also: SPL_SP500int_VaR, SPL_SP500in_tsplot

Author: Jinhua Yang, Fan Song, Wei Zhang, Yue Wang

Datafile: data_stock.csv

Output: test results of DW test and Engle''s ARCH test

```


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

# install.packages('tseries') install.packages('zoo') install.packages('FinTS')
# install.packages('lmtest')
library("tseries")
library(zoo)
library(FinTS)
library(lmtest)

pvalue_dwtest = matrix(rep(0), ncol = 10)
dw_stat = matrix(rep(0), ncol = 10)
for (i in 1:10) {
    dw = dwtest(return[2:247, i] ~ return[1:246, i])
    pvalue_dwtest[, i] = dw$p.value
    dw_stat[, i] = dw$statistic
}
pvalue_dwtest = as.data.frame(pvalue_dwtest)
dw_stat = as.data.frame(dw_stat)
dwtest = rbind(dw_stat, pvalue_dwtest)
names(dwtest) = names(stock)[2:11]
rownames(dwtest) = c("dw_stat", "p_value")
write.csv(dwtest, "dwtest.csv")

return1 = as.list(return)
archtest = lapply(return1, ArchTest, lags = 8, demean = TRUE)
a = as.data.frame(matrix((unlist(archtest)), c(5, 10)))
LM_test_ARCH = rbind(a[1, ], a[3, ])
names(LM_test_ARCH) = names(stock)[2:11]
rownames(LM_test_ARCH) = c("LM_stat", "P_value")
write.csv(LM_test_ARCH, "LM_test_ARCH.csv")

```
