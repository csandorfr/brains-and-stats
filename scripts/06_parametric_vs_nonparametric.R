# ============================================================
# Parametric (t-test) vs Non-parametric (Wilcoxon/Mann–Whitney)
# ============================================================
# Goal:
# - See how the choice of test matters when assumptions (normality) hold or fail.
# - Compare p-values for normally distributed data vs strongly skewed data.

set.seed(4)  # reproducibility

# ------------------------------------------------------------
# 1) Generate two scenarios
# ------------------------------------------------------------

# A) Approximately normal data (e.g., heights in cm)
#    Same SD, different means (175 vs 170)
normA <- rnorm(30, mean = 170, sd = 8)   # "Group A"
normB <- rnorm(30, mean = 175, sd = 8)   # "Group B"

# B) Strongly skewed data (e.g., incomes/reaction times)
#    Log-normal: positive, right-skewed; B has larger location
skewA <- rlnorm(30, meanlog = 0.0, sdlog = 0.7)
skewB <- rlnorm(30, meanlog = 0.3, sdlog = 0.7)

# ------------------------------------------------------------
# 2) Run tests on both scenarios
# ------------------------------------------------------------
# t.test = parametric; assumes approximately normal data (or large n)
# wilcox.test = non-parametric; uses ranks; robust to skew/outliers
# Note: wilcox.test(x, y) is the Mann–Whitney rank-sum test for two independent samples.

# --- Normal data ---
t_norm  <- t.test(normB, normA, var.equal = TRUE)     # two-sample t-test
mw_norm <- wilcox.test(normB, normA)                  # Mann–Whitney (Wilcoxon rank-sum)

# --- Skewed data ---
t_skew  <- t.test(skewB, skewA, var.equal = TRUE)
mw_skew <- wilcox.test(skewB, skewA)

# ------------------------------------------------------------
# 3) Display concise results
# ------------------------------------------------------------
cat("=== Normally distributed data ===\n")
cat("t-test p-value        :", signif(t_norm$p.value, 3), "\n")
cat("Mann–Whitney p-value :", signif(mw_norm$p.value, 3), "\n\n")

cat("=== Skewed data ===\n")
cat("t-test p-value        :", signif(t_skew$p.value, 3), "\n")
cat("Mann–Whitney p-value :", signif(mw_skew$p.value, 3), "\n")

# ------------------------------------------------------------
# 4) Quick teaching notes
# ------------------------------------------------------------
# - When data are ~normal with similar variances:
#     t-test is appropriate and often *more powerful* (smaller p for same effect).
# - When data are skewed, have outliers, or are ordinal:
#     Mann–Whitney is safer (fewer false positives due to assumption violations).
# - With small samples, violations of normality affect the t-test more.
# - Always plot/inspect data first (histogram/boxplot) before choosing the test.
