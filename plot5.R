
# Coursera Exploratory Data Analysis
# Project 2
# plot 5

NEI_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\summarySCC_PM25.rds")
SCC_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\Source_Classification_Code.rds")
# NEI = National Emissions Inventory
# SCC = Source Classification Code
setwd("D:\\Exploratory_Data_Analysis\\Project_2")

######################################## Q5 ########################################
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
####################################################################################
library(dplyr)
NEI_05 <- filter(NEI_04, fips=="24510")
NEI_05_MV <- NEI_05[grep("[Mm]otor|[Vv]ehicle", NEI_05$Short.Name), ]
NEI_05_MV_year <- aggregate(NEI_05_MV$Emissions, list(NEI_05_MV$year), sum)

png( "plot5.png", width=480, height=480, units='px')
plot_5 <- barplot(NEI_05_MV_year$x, names.arg =NEI_05_MV_year$Group.1, col="transparent", space=1, xlab="Year", 
                  ylab=expression(paste(PM[2.5], " from motor vehicle sources (tons)")))
invisible(dev.off())