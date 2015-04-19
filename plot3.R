
# Coursera Exploratory Data Analysis
# Project 2
# plot 3

NEI_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\summarySCC_PM25.rds")
SCC_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\Source_Classification_Code.rds")
# NEI = National Emissions Inventory
# SCC = Source Classification Code
setwd("D:\\Exploratory_Data_Analysis\\Project_2")

######################################## Q3 ########################################
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
####################################################################################
library(dplyr)
library(ggplot2)
NEI_03 <- filter(NEI_00, fips=="24510")
NEI_03_type_year <- aggregate(NEI_03$Emissions, list(NEI_03$type, NEI_03$year), sum)
names(NEI_03_type_year) <- c("type","year","Emissions")

png( "plot3.png", width=480, height=480, units='px')
plot_3 <- ggplot(NEI_03_type_year, aes(x=year, y=Emissions))+geom_smooth(aes(x=year, y=Emissions, color=type),size=1,se=FALSE)+labs(title="Emissions of the four types of sources in Baltimore City")+labs(x="Year",y=expression(PM[2.5]*"  Emissions (tons)"))
print(plot_3)
invisible(dev.off())