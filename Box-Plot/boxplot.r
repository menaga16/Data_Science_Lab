data <- read.csv("preprocessed_demo_bmi.csv", header = TRUE)
boxplot(data$Height, main = "Boxplot of Height", ylab = "Height (cm)")
boxplot(data$Weight, main = "Boxplot of Weight", ylab = "Weight (kg)")
boxplot(Height ~ Index, data = data, main = "Boxplot of Height by Index", ylab = "Height (cm)")
boxplot(Weight ~ Index, data = data, main = "Boxplot of Weight by Index", ylab = "Weight (kg)")

