data <- read.csv("preprocessed_demo_bmi.csv", header = TRUE)
data_numeric <- data[, sapply(data, is.numeric)]

correlation_matrix <- cor(data_numeric, method = "spearman")
print(correlation_matrix)

heatmap(correlation_matrix,
        col = colorRampPalette(c("#EFF3FF", "#BDD7E5", "#6BAED6", "#3182BD", "#08519C"))(100), # Lighter colors
        scale = "none",
        symm = TRUE,
        main = "Correlation Heatmap Using Spearman",
        cex.axis = 0.6,
        cex.lab = 0.6,
        cexRow = 1,
        cexCol = 1)
