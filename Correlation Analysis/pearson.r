data <- read.csv("preprocessed_demo_bmi.csv", header = TRUE)
data_numeric <- data[, sapply(data, is.numeric)]
correlation_matrix <- cor(data_numeric, method = "pearson")
heatmap(correlation_matrix,
        col = colorRampPalette(c("#EFF3FF", "#BDD7E7", "#6BAED6", "#3182BD", "#08519C"))(100),
        scale = "none",
        symm = TRUE,
        main = "Correlation Heatmap Using pearson",
        cex.axis = 0.8,
        cex.lab = 0.8,
        cexRow = 1,
        cexCol = 1)
