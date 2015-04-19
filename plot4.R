
# Coursera Exploratory Data Analysis
# Project 2
# plot 4

NEI_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\summarySCC_PM25.rds")
SCC_00 <- readRDS("D:\\Exploratory_Data_Analysis\\Project_2\\Source_Classification_Code.rds")
# NEI = National Emissions Inventory
# SCC = Source Classification Code
setwd("D:\\Exploratory_Data_Analysis\\Project_2")

######################################## Q4 ########################################
# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999-2008?
####################################################################################
library(dplyr)
SCC_04 <- select(SCC_00, SCC, Short.Name)
NEI_04 <- merge(NEI_00, SCC_04, by.x="SCC", by.y="SCC",sort=FALSE)
NEI_04_Coal <- NEI_04[grep("Coal", NEI_04$Short.Name), ]
NEI_04_Coal_year <- aggregate(NEI_04_Coal$Emissions, list(NEI_04_Coal$year), sum)

png( "plot4.png", width=480, height=480, units='px')
plot_4 <- barplot(NEI_04_Coal_year$x, names.arg =NEI_04_Coal_year$Group.1, col="transparent", space=1, xlab="Year", 
                  ylab=expression(paste(PM[2.5], " from coal combustion-related sources (tons)")))
invisible(dev.off())