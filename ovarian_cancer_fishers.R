# Load the dataset
data <- read.csv("D:/CEU_GROUP/GenosysCEU/Ovarian Cancer/ovarian-cancer-genomics/ovarian_cancer.csv")

# Separate clinical and gene data
clinical_data <- data[, c("survival_status", "chemo_response", "surgery_type", "cytoreduction_outcome")]
gene_data <- data[, !(names(data) %in% c("survival_status", "chemo_response", "surgery_type", "cytoreduction_outcome"))]

# Define outcomes using English names
outcomes <- c("survival_status", "surgery_type", "chemo_response", "cytoreduction_outcome")

# Store results in a list
fisher_results_all <- list()

# Loop over each outcome variable
for (outcome in outcomes) {
  outcome_vector <- clinical_data[[outcome]]
  gene_cols <- colnames(gene_data)
  
  # Store Fisher results for this outcome
  results_fisher <- data.frame(Gene = character(), P_value = numeric(), stringsAsFactors = FALSE)
  
  for (gene in gene_cols) {
    mutation_vector <- gene_data[[gene]]
    
    # Create contingency table (2x2)
    contingency_table <- table(mutation_vector, outcome_vector)
    
    # Run only if 2x2 table
    if (all(dim(contingency_table) == c(2, 2))) {
      fisher_test <- fisher.test(contingency_table)
      results_fisher <- rbind(results_fisher, data.frame(Gene = gene, P_value = fisher_test$p.value))
    }
  }
  
  # Apply FDR correction
  results_fisher$FDR <- p.adjust(results_fisher$P_value, method = "BH")
  
  # Sort by FDR
  results_fisher <- results_fisher[order(results_fisher$FDR), ]
  
  # Store results
  fisher_results_all[[outcome]] <- results_fisher
}

# Print summary for each outcome
for (outcome in names(fisher_results_all)) {
  cat("\nOutcome:", outcome, "\n")
  sig_genes <- fisher_results_all[[outcome]][fisher_results_all[[outcome]]$FDR < 0.05, ]
  if (nrow(sig_genes) > 0) {
    print(sig_genes)
  } else {
    cat("No significant genes after FDR correction.\n")
  }
}
