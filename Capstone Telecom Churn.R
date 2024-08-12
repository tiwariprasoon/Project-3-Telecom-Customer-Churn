
# Steps to perform:
#   
#   1.	Import the data files

setwd('E:/R  Imp/CAPSTONES/Churn')
churn <- read.csv('churn.csv')
internet <- read.csv('internet.csv')
customer <- read.csv('customer.csv')

# 2.	Check the structure of the data files and show the common column

str(churn)
str(internet)
str(customer)
df <- list(churn,internet,customer)
common_column = Reduce(intersect, lapply(df, names))
common_column

# 3.	Create combined data by merging the three datafiles

merged <- merge(customer, internet, by = "customer_ID")
str(merged)
data <- merge(merged, churn, by = "customer_ID")
str(data)

# 4.	Do a preliminary statistical summary of this combined data

summary(data)
 
# 5.	Identify all categorical columns and convert them to factor type
str(data)
sapply(data,class)
char_cols <- names(data)[sapply(data,class)== 'character']
data[char_cols]<- lapply(data[char_cols], factor)
str(data)
# View(data)
# 6.	Check for missing and trivial values
# 7.	Remove the rows with missing values

sapply(data, function(x) sum(is.na(x)))
data1 = na.omit(data)

# 8.	Check for outliers in the numerical variables using a box plot and if any, remove them


boxplot(data1$tenure)
boxplot(data1$MonthlyCharges)
boxplot(data1$TotalCharges)

# 9.	Study the overall distribution of the Churn variable

table(data1$Churn)






