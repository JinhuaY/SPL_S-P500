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
