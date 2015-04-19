
# Coursera Exploratory Data Analysis
# Project 2
# plot 6

NEI_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\summarySCC_PM25.rds")
SCC_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\Source_Classification_Code.rds")
# NEI = National Emissions Inventory
# SCC = Source Classification Code
setwd("D:\\Exploratory_Data_Analysis\\Project_2")

######################################## Q6 ########################################
# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
####################################################################################
library(dplyr)
NEI_06 <- filter(NEI_04, fips=="06037")
NEI_06_MV <- NEI_06[grep("[Mm]otor|[Vv]ehicle", NEI_06$Short.Name), ]
NEI_06_MV_year <- aggregate(NEI_06_MV$Emissions, list(NEI_06_MV$year), sum)

png( "plot6.png", width=480, height=480, units='px')
plot_6 <- plot(NEI_05_MV_year$Group.1,NEI_05_MV_year$x,  type="l",lty=1, lwd=2,ylim=c(0,2000),col="red", xlab="Year", 
               ylab=expression(paste(PM[2.5], " from motor vehicle sources (tons)")))
points(NEI_05_MV_year$Group.1,NEI_06_MV_year$x,  type="l",lty=1,lwd=2,col="blue")
legend("topright", c("Baltimore City","Los Angeles County"), lty=c(1,1),col=c("red", "blue"),lwd=c(2,2))
invisible(dev.off())