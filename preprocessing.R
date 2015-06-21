
# Read the xlsx file
raw.data <- read.xlsx(file="Indicator_Improved_sanitation_total_percent.xlsx", sheetName = "Data", colClasses = )

# Extract columns and name the first column as "Country"
# column.names <- c("Country",as.character.numeric_version(raw.data[1,2:22]))
column.names <- c("Country",colnames(raw.data[1,2:22]))
column.names <- gsub("X", "",x=column.names)

# Give proper names to all columns
colnames(raw.data) <- column.names

# Take only the countries where the data is completely available from
# 1990 to 2010
total.sanitation.data <- raw.data[complete.cases(raw.data),]

# Some countries have 100% sanitation facility from 1990 
# They are omitted
total.sanitation.data <- total.sanitation.data[which(total.sanitation.data[,2] != 100 ),]

# Write the data to an xlsx file to add 'Continent' column manually
write.xlsx(x = total.sanitation.data, file = "Improved_Sanitation_Total_percent.xlsx", sheetName = "Data")

