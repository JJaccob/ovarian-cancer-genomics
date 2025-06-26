# Ovarian Cancer Mutation–Clinical Association Analysis

This project explores associations between somatic gene mutations and clinical outcomes in an ovarian cancer patient cohort. The analysis includes statistical testing and unsupervised clustering.

## Project Summary

- 50 genes (binary: mutated = 1, wild-type = 0)
- 4 clinical outcomes (all binary: 0 = no, 1 = yes):
  - `survival_status` – patient survival
  - `chemo_response` – response to chemotherapy
  - `surgery_type` – primary vs. interval surgery
  - `cytoreduction_outcome` – outcome of cytoreductive surgery

> **Note**: The original clinical-genomic dataset is not included due to data-sharing restrictions.

## Methods

- Data cleaning: removed genes with no mutations; converted clinical variables to binary
- Statistical analysis:
  - Univariate testing via Fisher's exact test
  - Multivariate logistic regression including clinical covariates
- Clustering & visualization:
  - Mutation heatmap with hierarchical clustering using the ComplexHeatmap package
  - Clinical outcomes annotated per patient

## Results

- No statistically significant gene-outcome associations after FDR correction
- Exploratory heatmaps showed visual mutation patterns that may relate to outcomes
- Genes such as **ERBB4**, **TP53**, **FLT3**, and **CSF1R** showed interesting clustering with clinical labels

These results are consistent with internal findings by collaborators and may support further hypothesis-driven studies.

## Repository Contents

- `ovarian_cancer_fishers.R` – Fisher’s exact test for each gene vs. clinical outcomes  
- `ovarian_cancer_multivariate_logreg.R` – Logistic regression adjusting for other clinical variables  
- `ovarian_cancer_complexheatmap.R` – Mutation heatmap and clustering visualization  
- `heatmap_mutation_exploration.png` – Output heatmap figure showing gene-patient mutation matrix  

## Requirements

- R version 4.0 or higher
- R packages:
  - `ComplexHeatmap`
  - `circlize`
  - `ggplot2`
  - Base `stats` package

## Author

**James Jacob Wabwile**  
MSc Bioinformatics, University of Nairobi  
Erasmus+ Research Intern – CEU, Spain  
📧 jamesbwile@gmail.com  

For questions, collaboration, or access to the dataset (with permission), feel free to reach out via email.
