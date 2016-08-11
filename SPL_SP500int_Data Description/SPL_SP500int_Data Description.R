# clear history
rm(list = ls(all = TRUE))
graphics.off()

# set working directory 
# setwd('...')

# Install packages if not installed
libraries = c("stargazer", "ggplot2", "gplots")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})

# Load packages
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

#read data
Paneldata = read.csv("Panel.csv")

# data description analysis
# plot graphics (use different color for different companies)
Ri = Paneldata$Ri
Rm = Paneldata$Rm
summary(Paneldata$Ri)
summary(Paneldata$Rm)

stargazer(Paneldata)

p = ggplot(Paneldata, aes(x = Rm,y = Ri,colours = factor(company)))
p + geom_point(aes(colour = factor(company))) + stat_smooth()

plotmeans(Ri ~ company, main = "Heterogeineity across companies", data = Paneldata)
plotmeans(Ri ~ date, n.label = FALSE, main = "Heterogeneity across time", data = Paneldata)

# Histograms with norm density use hist() for market price
h = hist(Ri, breaks = 10, col = "blue")
xfit = seq(min(Ri), max(Ri), length = 100)
yfit = dnorm(xfit, mean = mean(Ri), sd = sd(Ri))
yfit = yfit * diff(h$mids[1:2]) * length(Ri)
lines(xfit, yfit, col = "red", lwd = 2)
box()

# use ggplot2 for individual company
p = ggplot(Paneldata, aes(x = Ri))
p + geom_histogram(aes(fill = factor(company), y = ..density..), alpha = 0.3, colour = "blue") + 
    stat_density(geom = "line", position = "identity", size = 1.5, aes(colour = factor(company))) + 
    facet_wrap(~company, ncol = 1) 
