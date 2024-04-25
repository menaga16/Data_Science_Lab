library(ggplot2)

data <- read.csv("C:/Users/menag/Downloads/SEM 6/DATA SCIENCE/LAB/EX 6/sales_data_sample.csv", header = TRUE)

if (!("SALES" %in% names(data)) || !("MONTH_ID" %in% names(data))) {
  stop("One or more required variables (SALES or MONTH_ID) not found in the dataset.")
}

months <- unique(data$MONTH_ID)
sales <- tapply(data$SALES, data$MONTH_ID, sum)

plot(months, sales, type = "o", col = "blue", xlab = "Month", ylab = "Sales", main = "Monthly Sales Trend")

month_numeric <- 1:length(months)
model <- lm(sales ~ month_numeric)

lines(months, predict(model), col = "red")

summary(model)

future_months <- 6
future_month_numeric <- seq(max(month_numeric) + 1, max(month_numeric) + future_months)
future_sales <- predict(model, newdata = data.frame(month_numeric = future_month_numeric))

plot(c(months, future_month_numeric), c(sales, future_sales), type = "o", col = "blue",
     xlab = "Month", ylab = "Sales", main = "Predicted Monthly Sales")
lines(future_month_numeric, future_sales, col = "red")

cat("Predicted Sales for Future Months:\n")
print(data.frame(Month = future_month_numeric, Predicted_Sales = future_sales))
