# Load necessary library
# No additional libraries needed unless you want to save/export plots

# Load the dataset
data <- read.csv("D:/CEU_GROUP/GenosysCEU/Ovarian Cancer/ovarian-cancer-genomics/ovarian_cancer.csv")

# Separate clinical and gene data
clinical_data <- data[, c("survival_status", "chemo_response", "surgery_type", "cytoreduction_outcome")]
gene_data <- data[, !(names(data) %in% c("survival_status", "chemo_response", "surgery_type", "cytoreduction_outcome"))]

# Prepare outcome and covariates using English column names
y <- clinical_data$survival_status
chemo <- clinical_data$chemo_response
surgery <- clinical_data$surgery_type
cytoreduction <- clinical_data$cytoreduction_outcome

# Initialize result storage
logit_results <- data.frame(
  Gene = character(),
  P_value = numeric(),
  OR = numeric(),
  FDR = numeric(),
  stringsAsFactors = FALSE
)

# Loop over each gene
for (gene in colnames(gene_data)) {
  gene_vector <- gene_data[[gene]]
  
  # Fit multivariate logistic regression model
  model <- glm(y ~ gene_vector + chemo + surgery + cytoreduction, family = "binomial")
  
  # Extract p-value and odds ratio for gene
  summary_model <- summary(model)
  p_val <- coef(summary_model)[2, 4]
  or <- exp(coef(model)[2])
  
  # Store results
  logit_results <- rbind(logit_results, data.frame(Gene = gene, P_value = p_val, OR = or))
}

# Adjust p-values using FDR (Benjamini-Hochberg)
logit_results$FDR <- p.adjust(logit_results$P_value, method = "BH")

# Sort by FDR
logit_results <- logit_results[order(logit_results$FDR), ]

# Print only significant genes
print(logit_results[logit_results$FDR < 0.05, ])

# Print top 10 genes with lowest FDR (for inspection)
head(logit_results, 10)
