# Ovarian Cancer Mutation–Clinical Association Analysis

This project explores associations between somatic gene mutations and clinical outcomes in an ovarian cancer patient cohort. The analysis includes statistical testing and unsupervised clustering.

## Project Summary

- 50 genes (binary: mutated = 1, wild-type = 0)
- 4 clinical outcomes:
  - exitus (survival status)
  - Intervalo_libre_pt (response to chemotherapy)
  - cx_primaria_o_intervalo (surgery type)
  - resultado_citorreduccion (cytoreduction outcome)

Note: The original dataset is not included due to data sharing restrictions.

## Methods

- Data cleaning and conversion of variables to binary format
- Univariate statistical testing (Fisher's exact test)
- Multivariate logistic regression with clinical covariates
- Clustering and visualization using ComplexHeatmap

## Results

- No statistically significant associations were found after FDR correction.
- Exploratory heatmap analysis highlighted possible gene clusters related to clinical variables.
- Genes such as ERBB4, TP53, FLT3, and CSF1R showed patterns worth further exploration.

These findings align with internal collaborator observations and can be used as a foundation for hypothesis-driven follow-up studies.

## Files

- `ovarian_cancer_fishers.R`: Fisher’s exact test for each gene vs. clinical outcomes
- `ovarian_cancer_multivariate_logreg.R`: Logistic regression models adjusted for clinical variables
- `ovarian_cancer_complexheatmap.R`: Heatmap visualization and clustering using ComplexHeatmap
- `heatmap_mutation_exploration.png`: Final visual showing patient clusters and mutation patterns

## Requirements

- R (>= 4.0)
- Packages: ComplexHeatmap, circlize, ggplot2, stats

## Author
James Jacob
jamesbwile@gmail.com
MSc Bioinformatics, University of Nairobi
Erasmus+ Research Intern – CEU Spain


For questions or data access, please contact me through email.

