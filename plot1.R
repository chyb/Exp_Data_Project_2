
# Coursera Exploratory Data Analysis
# Project 2
# plot 1

NEI_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\summarySCC_PM25.rds")
SCC_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\Source_Classification_Code.rds")
# NEI = National Emissions Inventory
# SCC = Source Classification Code
setwd("D:\\Exploratory_Data_Analysis\\Project_2")

######################################## Q1 ########################################
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.
####################################################################################
library(dplyr)
NEI_01 <- aggregate(NEI_00$Emissions, list(NEI_00$year), sum)

png( "plot1.png", width=480, height=480, units='px')
plot_1 <- barplot(NEI_01$x, names.arg =NEI_01$Group.1, col="transparent", space=1, xlab="Year", 
                  ylab=expression(paste("Total ", PM[2.5], " emission from all sources (tons)")))
invisible(dev.off())