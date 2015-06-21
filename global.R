# Any code in this file is guaranteed to be called before either
# ui.R or server.R

library(shiny)
library(ggplot2)
library(markdown)
# For reading xlsx files
library(xlsx)

# Read the sanitation xlsx file
sanitation.data <- read.xlsx2(file="Improved_Sanitation_Total_percent.xlsx", sheetName = "Data", stringsAsFactors=FALSE, colClasses = c(rep("character",2),rep("numeric",21)))

# Remove unwanted X from 'year'
column.names <- gsub("X", "Year.",x= colnames(sanitation.data))
colnames(sanitation.data) <- column.names


year <- seq(1990, 2010, by = 1)
plot.data <- as.data.frame(year)
plot.data <- cbind(plot.data,rep(0,21))
colnames(plot.data)<- c("year","country.percent")
