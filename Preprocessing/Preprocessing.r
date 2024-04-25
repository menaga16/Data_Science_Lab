
data <- read.csv("C:/Users/menag/Downloads/BMI/bmi.csv", header = TRUE)

missing_values <- anyNA(data)
if (missing_values)
{
  cat("There are missing values in the data.\n")
  data <- na.omit(data)
}else{
  cat("there is no missing values")
}

data$Index <- as.factor(data$Index)


write.csv(data, "preprocessed_demo_bmi.csv", row.names = FALSE)


