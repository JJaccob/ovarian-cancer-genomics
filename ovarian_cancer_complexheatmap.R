# Load required libraries
library(ComplexHeatmap)
library(circlize)

# Set working directory (optional, for local use)
# setwd("D:/CEU_GROUP/GenosysCEU/Ovarian Cancer/ovarian-cancer-genomics")

# Load data
data <- read.csv("D:/CEU_GROUP/GenosysCEU/Ovarian Cancer/ovarian-cancer-genomics/ovarian_cancer.csv")

# Separate clinical data and gene mutation matrix
clinical_data <- data[, c("survival_status", "chemo_response", "surgery_type", "cytoreduction_outcome")]
gene_data <- data[, !(names(data) %in% c("survival_status", "chemo_response", "surgery_type", "cytoreduction_outcome"))]

# Convert gene matrix to numeric matrix
gene_matrix <- as.matrix(gene_data)

# Define annotation colors using new English names
annotation_colors <- list(
  survival_status = c("0" = "gray80", "1" = "red"),
  chemo_response = c("0" = "lightblue", "1" = "darkblue"),
  surgery_type = c("0" = "lightgreen", "1" = "darkgreen"),
  cytoreduction_outcome = c("0" = "orange", "1" = "brown")
)

# Create annotation for patients (rows)
ra <- rowAnnotation(df = clinical_data,
                    col = annotation_colors,
                    show_annotation_name = TRUE,
                    annotation_name_side = "top")

# Plot heatmap
Heatmap(gene_matrix,
        name = "Mutation",
        col = c("0" = "white", "1" = "black"),
        right_annotation = ra,
        cluster_rows = TRUE,
        cluster_columns = TRUE,
        show_row_names = FALSE,
        show_column_names = TRUE,
        column_names_gp = gpar(fontsize = 8))

# Save heatmap to PDF
pdf("D:/CEU_GROUP/GenosysCEU/Ovarian Cancer/ovarian-cancer-genomics/ovarian_heatmap.pdf", width = 10, height = 8)

draw(Heatmap(gene_matrix,
             name = "Mutation",
             col = c("0" = "white", "1" = "black"),
             right_annotation = ra,
             cluster_rows = TRUE,
             cluster_columns = TRUE,
             show_row_names = FALSE,
             show_column_names = TRUE,
             column_names_gp = gpar(fontsize = 8)))

dev.off()
