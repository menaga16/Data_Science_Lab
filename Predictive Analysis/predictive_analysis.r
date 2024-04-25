
library(glmnet)

diabetes_data <- read.csv("C:/Users/menag/Downloads/SEM 6/DATA SCIENCE/LAB/EX7/diabetes.csv")

str(diabetes_data)

X <- diabetes_data[, c("BMI", "Glucose")]
y <- diabetes_data$Outcome

model <- glm(Outcome ~ BMI + Glucose, family = binomial(link = "logit"), data = diabetes_data)

bmi_values <- seq(min(diabetes_data$BMI), max(diabetes_data$BMI), length.out = 100)
glucose_values <- seq(min(diabetes_data$Glucose), max(diabetes_data$Glucose), length.out = 100)
grid <- expand.grid(BMI = bmi_values, Glucose = glucose_values)

predictions_grid <- predict(model, newdata = grid, type = "response")

predictions_matrix <- matrix(predictions_grid, nrow = length(bmi_values), ncol = length(glucose_values))

filled.contour(bmi_values, glucose_values, predictions_matrix,
               color.palette = colorRampPalette(c("lightblue", "darkblue")),
               main = "Diabetes Prediction",
               xlab = "BMI",
               ylab = "Glucose")
