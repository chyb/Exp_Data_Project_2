
# Coursera Exploratory Data Analysis
# Project 2
# plot 2

NEI_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\summarySCC_PM25.rds")
SCC_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\Source_Classification_Code.rds")
# NEI = National Emissions Inventory
# SCC = Source Classification Code
setwd("D:\\Exploratory_Data_Analysis\\Project_2")

######################################## Q2 ########################################
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.
####################################################################################
library(dplyr)
NEI_02 <- filter(NEI_00, fips=="24510")
NEI_02_Mrl_total <- aggregate(NEI_02$Emissions, list(NEI_02$year), sum)

png( "plot2.png", width=480, height=480, units='px')
plot_2 <- barplot(NEI_02_Mrl_total$x, names.arg =NEI_02_Mrl_total$Group.1, col="transparent", space=1, xlab="Year", 
                  ylab=expression(paste("Total emissions from  ", PM[2.5], " in the Baltimore City (tons)")))
invisible(dev.off())
